#!/run/current-system/sw/bin/bash
export DISTRO=$(cat /etc/os-release | grep "^ID=" | cut -d '=' -f 2 | sed 's/"//g')

function wal {
#    feh --bg-scale /data/.local/share/wallpapers/"$1"
    feh --bg-scale /data/Pictures/Artwork/"$1"
}

#if [[ $DISTRO == "debian" ]]; then
#    wal "Socialism/Karl Marx Quote Democracy is the road to socialism.jpg"
#elif [[ $DISTRO == "arch" ]]; then
#    wal "Arch/Arch Linux Wallpapers (3).jpg"
#elif [[ $DISTRO == "void" ]]; then
#    wal "blue night 2k.jpg"
#elif [[ $DISTRO == "gentoo" ]]; then
#    wal "Gentoo/Sky blue Gentoo logo (with some variation in colour) on purple (with variation) background.jpg"
#fi
#wal "Doxorubicin, imatinib, cyclophosphamide, methotrexate on Mandelbrot fractal.png"
feh --bg-scale /data/Pictures/Cats/Goliath_AngelPaws_FB1.png 
