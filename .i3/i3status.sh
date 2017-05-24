#!/bin/sh

/usr/bin/i3status -c $HOME/.i3status.conf | while :
do
    read line
    RAM=`free -kh | grep Mem | awk '{print $3}'`
    TOTR=$(cat /proc/meminfo | grep MemT | sed 's/.*\://g' | sed 's/ *//g' | sed 's/kB//g')
    g++ -o ram.o $HOME/.i3/ram.cpp
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
    g++ -o cpu.o $HOME/.i3/cpu.cpp
    CPU=$(./cpu.o)

    printf "%s\n" "Up: $UP | CPU: $CPU% | RAM: $RAM/$TOT | $line"
done
