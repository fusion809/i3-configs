#!/bin/zsh

# band function
function band {
    cat /proc/net/dev | grep "wlo1" | cut -d ':' -f 2 | cut -d ' ' -f 2
}

# Initial bandwidth download
BAND1=$(band)

# Second(s) to wait to recheck file
S="0.05"

# Sleep for those secs
sleep $S

# Re-run command
BAND2=$(band)

# Determine difference
let DIFF=BAND2-BAND1

# Determine rate of change in download bandwidth over time interval
let RATE=DIFF/S

# Convert rate to kB/s
let RATEkB=RATE/1024

# Print rate in kB/s
printf '%.2f' "$RATEkB"
