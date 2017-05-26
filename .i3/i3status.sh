#!/bin/bash

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

    printf "%s\n" "Up: $UP | ↓ $DOWN ↑ $UPL | CPU: $CPU% | RAM: $RAM/$TOT | $line"
done
