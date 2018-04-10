#!/bin/bash
export DISTRO=$(cat /etc/os-release | grep "^ID=" | cut -d '=' -f 2 | sed 's/"//g')

function wal {
    feh --bg-scale /data/.local/share/wallpapers/"$1"
}

if [[ $DISTRO == "debian" ]]; then
    wal "Blue Debian logo on grey background.jpg"
elif [[ $DISTRO == "arch" ]]; then
    wal "Arch Linux Wallpapers (3).jpg"
elif [[ $DISTRO == "void" ]]; then
    wal "blue night 2k.jpg"
elif [[ $DISTRO == "gentoo" ]]; then
    wal "1833168.jpg"
fi
