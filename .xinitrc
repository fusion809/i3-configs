feh --bg-scale /home/fusion809/.local/share/wallpapers/"Gentoo Linux Wallpapers (2)".jpg && \
DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     awesome) exec awesome ;;
     kde) exec startkde ;;
     mate) exec mate-session ;;
     *) exec $DEFAULTSESSION ;;
esac
