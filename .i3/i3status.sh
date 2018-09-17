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

    # Weather
    	WEATHER=$(curl "wttr.in/townsville?0?T")
	TEMP=$(echo $WEATHER | tail -n 4 | head -n 1 | rev | sed 's/ //g' | rev | sed 's/.*\.//g')
    ##########################################################################################
    ###################################### Status ############################################
    ##########################################################################################
printf "%s\n" "$TEMP | RAM: $RAM/${RAM_AVAILABLE} | Up $uptime | $DATE"
done
