#!/bin/zsh

/usr/bin/i3status -c $HOME/.i3status.conf | while :
do
    read line
    cd $HOME/.i3
    # RAM
    RAM=`free -kh | grep Mem | awk '{print $3}'`
    TOTR=$(cat /proc/meminfo | grep MemT | sed 's/.*\://g' | sed 's/ *//g' | sed 's/kB//g')
    g++ -o ram.o ram.cpp
    TOT=$(./ram.o $TOTR | sed 's/$/G/g' )

    # Put uptime
    uptime=`uptime | awk '{print $3 " " $4}' | sed 's/,.*//'`
    hour=$(echo $uptime | grep "\:" | sed 's/\:.*//g')
    min=$(echo $uptime | sed 's/.*\://g' | sed "s/min//g")
    if [[ -n $hour ]]; then
         UP="${hour}h ${min}m"
    else
         UP="${min}m"
    fi

    # Compile C++ CPU prog and run it
    g++ -o cpu.o cpu.cpp
    CPU=$(./cpu.o)

    # Download rate
    DOWN=$(./download.sh)
    # Upload rate
    UPL=$(./upload.sh)

    function temp {
         K=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp$1_input)
         let K=K/1000
         printf "$K°"
    }

    # Temp of core 1
    TEMP0=$(temp 1)

    # Temp of core 2
    TEMP1=$(temp 2)

    # Temp of core 3
    TEMP2=$(temp 3)

    # Temp of core 4
    TEMP3=$(temp 4)

    # Temp of core 5
    TEMP4=$(temp 5)

    # Date
    DATE=$(date +"%l:%M:%S %p, %a %d %b %y")

    # CPU Load
    LOAD=$(uptime | cut -d ':' -f 5 | cut -d ',' -f 1 | sed 's/ //g')

    printf "%s\n" "Up: $UP | ↓ $DOWN kB/s ↑ $UPL kB/s | CPU: $CPU% | RAM: $RAM/$TOT | Load: $LOAD | $TEMP0 | $TEMP1 | $TEMP2 | $TEMP3 | $TEMP4 | $DATE"
done
