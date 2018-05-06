feh --bg-scale /data/Pictures/Artwork/'Doxorubicin, imatinib, cyclophosphamide, methotrexate on Mandelbrot fractal.png' && \
DEFAULTSESSION=i3

case "$1" in
     i3) exec i3 ;;
     awesome) exec awesome ;;
     kde) exec startkde ;;
     mate) exec mate-session ;;
     *) exec $DEFAULTSESSION ;;
esac
