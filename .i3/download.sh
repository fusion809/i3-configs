#!/bin/bash

function band {
    cat /proc/net/dev | grep "wlo1" | cut -d ':' -f 2 | cut -d ' ' -f 2
}

# Initial bandwidth download
BAND1=$(band)

# Seconds to wait to recheck file
S="1"

# Sleep for those secs
sleep $S

# Re-run command
BAND2=$(band)

# Determine difference
let DIFF=BAND2-BAND1
let RATE=DIFF/S
let RATEkB=RATE/1024

printf "$RATEkB kB/s"
