#!/run/current-system/sw/bin/zsh

killall daemon.o
cd $HOME/.i3 && ./daemon.o && cd -
i3status -c $HOME/.i3status.conf | while :
do
    # Read input
    read line

    # cd into ~/.i3
    cd $HOME/.i3

    ##########################################################################################
    ######################################## RAM #############################################
    ##########################################################################################
    RAM=$(free -kh | grep Mem | awk '{print $3}' | sed 's/Gi/G/g')
    TOTR=$(cat /proc/meminfo | grep MemT | sed 's/.*\://g' | sed 's/ *//g' | sed 's/kB//g')
    TOT=$(/data/GitHub/mine/scripts/nixos-scripts/usr/local/bin/ram $TOTR | sed 's/$/G/g' )

    ##########################################################################################
    ####################################### Uptime ###########################################
    ##########################################################################################
    uptime=$(cat /proc/uptime | cut -d ' ' -f 1)
    uptime=$(octave --eval "round($uptime)" | sed 's/ans \= *//g') 
    hour=$(octave --eval "fix($uptime/3600)" | sed 's/ans \= *//g')
    min=$(octave --eval "fix($uptime/60-$hour*60)" | sed 's/ans \= *//g')
    sec=$(octave --eval "fix($uptime-$hour*3600-$min*60)" | sed 's/ans \= *//g')
    if ! [[ $hour == 0 ]]; then
         UP="${hour}h ${min}m ${sec}s"
    else
         UP="${min}m ${sec}s"
    fi

    ##########################################################################################
    #################################### Date Transfer #######################################
    ##########################################################################################
    # Download rate
    #DOWN=$(cat $HOME/.i3/down.log | tail -n 1)
    # Upload rate
    #UPL=$(cat $HOME/.i3/up.log | tail -n 1)

    ##########################################################################################
    ##################################### CPU usage ##########################################
    ##########################################################################################
    CPU=$(./cpu.o)
    ##########################################################################################
    ###################################### CPU Temp ##########################################
    ##########################################################################################
    #$function temp {
     #    K=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp$1_input)
     #    let K=K/1000
     #    printf "$K°"
    #}

    # Temp of core 1
   # TEMP0=$(temp 1)

    # Temp of core 2
#    TEMP1=$(temp 2)

    # Temp of core 3
 #   TEMP2=$(temp 3)

    # Temp of core 4
  #  TEMP3=$(temp 4)

    # Temp of core 5
   # TEMP4=$(temp 5)

    # Date
    DATE=$(date +"%l:%M:%S %p, %a %d/%m/%y")

    ##########################################################################################
    ###################################### CPU Load ##########################################
    ##########################################################################################
    function load {
         uptime | cut -d ':' -f "$1" | cut -d ',' -f "$2" | grep "[0-9]" | sed 's/ //g'
    }

    loadcheck=$(load 4 2)
    if [[ $hour -ge "1.0" ]]; then
         LOAD=$(load 5 1)
    elif [[ $loadcheck -gt "0.05" ]]; then
         LOAD=$(load 4 1)
    else
         LOAD=$(load 4 1)
    fi

    ##########################################################################################
    ##################################### Weather ############################################
    ##########################################################################################
#    temp=$(cat temp.txt)
#    cond=$(cat cond.txt)

    ##########################################################################################
    ###################################### Status ############################################
    ##########################################################################################
 #  printf "%s\n" "$cond $temp °C | Up: $UP | ↓ $DOWN kB/s ↑ $UPL kB/s | CPU: $CPU% | RAM: $RAM/$TOT | Load: $LOAD | $TEMP0 | $TEMP1 | $TEMP2 | $TEMP3 | $TEMP4 | $DATE"
 #   export PATH=$PATH:/data/GitHub/mine/scripts/nixos-scripts/usr/local/bin
#    printf "%s\n" "$(0adn) | $(avogadroln) | $(avogadron) | $(jmoln) | $(komodon) | $(libmsymn) | $(molen) | $(notepadqqn) | $(obsd) | $(obsf) | $(obss) | $(openbabeln) | $(openran) | $(openrabn) | $(openracn) | $(openracan) | $(openrad2n) | $(openradn) | $(openragn) | $(openra2n) | $(openramwn) | $(openraspn) | $(openrauran) | $(openrayn) | $(oscn) | $(rofin) | $(spglibn) | $(subln) | $(vimn) | $(vscoden) | $(zshn) | Up: $UP | CPU: $CPU% | RAM: $RAM/$TOT | Load: $LOAD | $DATE"
    echo "Up: $UP | CPU: $CPU% | RAM: $RAM/$TOT | Load: $LOAD | $DATE"

    #printf "%s\n" "Up: $UP | CPU: $CPU% | RAM: $RAM/$TOT | Load: $LOAD | $TEMP0 | $TEMP1 | $TEMP2 | $TEMP3 | $TEMP4 | $DATE"

done
