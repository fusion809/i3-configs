feh --bg-scale "/home/fusion809/.local/share/wallpapers/Debian/Blue Debian logo on grey background.jpg" && \
DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     awesome) exec awesome ;;
     kde) exec startkde ;;
     mate) exec mate-session ;;
     *) exec $DEFAULTSESSION ;;
esac
