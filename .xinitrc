feh --bg-scale /data/GitHub/mine/artwork/PDB-5J2T/5J2T-PyMOL-chain-colouring-legend-labelled-white-bg.png && \
DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     awesome) exec awesome ;;
     kde) exec startkde ;;
     mate) exec mate-session ;;
     *) exec $DEFAULTSESSION ;;
esac
