#!/bin/sh

/usr/bin/i3status -c $HOME/.i3status.conf | while :
do
    read line
    RAM=`free -kh | grep Mem | awk '{print $3}'`

    # Put uptime
    uptime=`uptime | awk '{print $3 " " $4}' | sed 's/,.*//'`
    hour=$(echo $uptime | sed 's/\:.*//g')
    min=$(echo $uptime | sed 's/.*\://g')
    UP="$hour h $min m"

    # Compile C++ CPU prog and run it
    g++ -o cpu.o $HOME/.i3/cpu.cpp
    CPU=$(./cpu.o)

    printf "%s\n" "Up: $UP | CPU: $CPU% | RAM: $RAM | $line"
done
