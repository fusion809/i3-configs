#!/usr/local/bin/zsh

killall daemon.o
cd $HOME/.i3 && ./daemon.o && cd -
/usr/local/bin/i3status -c $HOME/.i3status.conf | while :
do
	# Read input
	read line

	# cd into ~/.i3
	cd $HOME/.i3

	##########################################################################################
	####################################### Uptime ###########################################
	##########################################################################################
	uptime=$(uptime | sed 's/[0-9]*:[0-9]*[A-P]M.*up //g' | cut -d ',' -f 1)

	# Date
	DATE=$(date +"%l:%M:%S %p, %a %d %b %y")

	# RAM
	RAM=$(octave --eval "($(freecolor | head -n 1 | cut -d ' ' -f 5 | cut -d '(' -f 2 | cut -d ')' -f 1 | cut -d '/' -f 2)-$(freecolor | head -n 1 | cut -d ' ' -f 5 | cut -d '(' -f 2 | cut -d ')' -f 1 | cut -d '/' -f 1))/(1024^2)" | cut -d ' ' -f 4)
	RAM_AVAILABLE=$(octave --eval "$(freecolor | head -n 1 | cut -d ' ' -f 5 | cut -d '(' -f 2 | cut -d ')' -f 1 | cut -d '/' -f 2)/(1024^2)" | cut -d ' ' -f 4)

	##########################################################################################
	###################################### Status ############################################
	##########################################################################################
	CORES=$(octave --eval "($(sysctl -a | grep temper | cut -d ':' -f 2 | sed 's/ //g' | sed 's/C//g' | tr '\n' '+' | sed 's/+$//g'))/16" | cut -d ' ' -f 4)
	TEMP="${CORES}C"

	# Disk Usage
	DISK_AVAIL=$(df -h / | tail -n 1 | tr ' ' '\n' | sed '/^$/d' | tail -n 5 | head -n 1)
	DISK_USED=$(df -h / | tail -n 1 | tr ' ' '\n' | sed '/^$/d' | tail -n 5 | head -n 3 | head -n 2 | tail -n 1)
	# CPU
	CPU_TOTAL=$(octave --eval "$(iostat | tr ' ' '\n' | sed '/^$/d' | tail -n 5 | head -n 4 | tr '\n' '+' | sed 's/+$//g')" | cut -d ' ' -f 4)
	printf "%s\n" "CPU: ${CPU_TOTAL}% | / ${DISK_USED}/${DISK_AVAIL} | Av(T): $TEMP | RAM: $RAM/${RAM_AVAILABLE} | Up $uptime | $DATE"
done
