#!/bin/sh

/usr/bin/i3status -c $HOME/.i3status.conf | while :
do
    read line
    ram=`free -kh | grep Mem | awk '{print $3}'`

    # Put uptime
    uptime=`uptime | awk '{print $3 " " $4}' | sed 's/,.*//'`

    # Compile C++ CPU prog and run it
    make
    CPU=$(cat cpu.txt)

    echo "$uptime | CPU: $CPU | $line" || exit "1"

done
