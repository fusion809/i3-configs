#!/bin/sh
# shell script to add RAM-usage to i3status
# needs sed, free and bc
## config
# status command has to be this script
## i3status.conf
# showing cpu_usage has to be enabled (because ram_usage is prepended to that with sed...)
# output_format has to be set to "i3bar"

WIRELESS=wlo1
ETH=eno1

i3status -c $1  | while :
do
    read line

    # if [ -e /sys/class/net/$ETH/operstate ] && [ `cat /sys/class/net/$ETH/operstate` == "up" ]; then
    #     ETHR2=`cat /sys/class/net/$ETH/statistics/rx_bytes`
    #     ETHT2=`cat /sys/class/net/$ETH/statistics/tx_bytes`
    #     ETHTBPS=`expr $ETHT2 - $ETHT1`
    #     ETHRBPS=`expr $ETHR2 - $ETHR1`
    #     ETHTKBPS=`expr $ETHTBPS / 1024`
    #     ETHRKBPS=`expr $ETHRBPS / 1024`

    #     ETHR1=$ETHR2
    #     ETHT1=$ETHT2
    #     sedeth="s/\(\"name\":\"ethernet\",\"instance\":\"$ETH\".*)\)\(\"}\)/\1 D $ETHRKBPS U $ETHTKBPS\2/"
    #     line=`echo $line | sed -e "$sedeth"`
    # fi

    # if [ -e /sys/class/net/$WIRELESS/operstate ] && [ `cat /sys/class/net/$WIRELESS/operstate` == "up" ]; then
    #     WLANR2=`cat /sys/class/net/$WIRELESS/statistics/rx_bytes`
    #     WLANT2=`cat /sys/class/net/$WIRELESS/statistics/tx_bytes`
    #     WLANTBPS=`expr $WLANT2 - $WLANT1`
    #     WLANRBPS=`expr $WLANR2 - $WLANR1`
    #     WLANTKBPS=`expr $WLANTBPS / 1024`
    #     WLANRKBPS=`expr $WLANRBPS / 1024`

    #     WLANR1=$WLANR2
    #     WLANT1=$WLANT2
    #     sedwlan="s/\(\"name\":\"wireless\",\"instance\":\"$WIRELESS\".*)\)\(\"}\)/\1 D $WLANRKBPS U $WLANTKBPS\2/"
    #     line=`echo $line | sed -e "$sedwlan"`
    # fi

    # get free RAM and Swap (this excludes cache)
    #RAM
    ram=`free -kh | grep Mem | awk '{print $3}'`
    swap=`free -kh | grep Swap | awk '{print $3}'`

    # if free RAM is less than 1GB show text in red, else green
    # if [ $(echo "$ram < 1" | bc) -eq 1 ]
    # then
    #     color=FF0000
    # else
    #     color=00FF00
    # fi

    # put ram_usage before cpu_usage
    sedline="s/cpu_usage/ram_usage\",\"color\":\"#8F00FF\",\"full_text\":\"RAM: ${ram}\"},{\"name\":\"cpu_usage/"
    line=`echo $line | sed -e "$sedline" | sed -e "s/% \"/%\"/"`

    # put swap_usage between ram_usage and cpu_usage
    sedline="s/cpu_usage/swap_usage\",\"color\":\"#8F00FF\",\"full_text\":\"SWAP: ${swap}\"},{\"name\":\"cpu_usage/"
    line=`echo $line | sed -e "$sedline" | sed -e "s/% \"/%\"/"`

    sensor=`sensors | grep "Physical" | awk '{print $4}'`
    sedline="s/battery/sensor\",\"full_text\":\"TEMP: ${sensor}\"},{\"name\":\"battery/"
    line=`echo $line | sed -e "$sedline" | sed -e "s/% \"/%\"/"`
    
    # Put uptime
    uptime=`uptime | awk '{print $3 " " $4}' | sed 's/,//'`
    sedline="s/battery/uptime\",\"full_text\":\"UPTIME: ${uptime}\"},{\"name\":\"battery/"
    line=`echo $line | sed -e "$sedline" | sed -e "s/% \"/%\"/"`


    #remove colons
    colonline='s/\([a-zA-Z]\):/\1/g'
    final=`echo $line | sed -e "$colonline"`

    echo "$final" || exit 1
done
