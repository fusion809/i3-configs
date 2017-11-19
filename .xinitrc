feh --bg-scale /home/fusion809/.local/share/wallpapers/84f191cf3684346e1d7216e1997f1c6dc3de298b.jpg && \
DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     awesome) exec awesome ;;
     kde) exec startkde ;;
     mate) exec mate-session ;;
     *) exec $DEFAULTSESSION ;;
esac
