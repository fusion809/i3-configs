#!/usr/bin/env python3
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

status.register("shell",
    command="/usr/local/bin/zshn",
    color="#FA7A94",
    interval=300)

status.register("shell",
    command="/usr/local/bin/vscoden",
    color="#0FC0FF",
    interval=300)

status.register("shell",
    command="/usr/local/bin/vimn",
    color="#99AAFF",
    interval=300)

status.register("shell",
    command="/usr/local/bin/adeptn",
    color="#FFCF76",
    interval=300)

status.register("shell",
    command="/usr/local/bin/swayn",
    color="#FF00BB",
    interval=300)

status.register("shell",
    command="/usr/local/bin/subln",
    color="#2F30FF",
    interval=300)

status.register("shell",
    command="/usr/local/bin/snapdgn",
    color="#33A0F0",
    interval=300)

status.register("shell",
    command="/usr/local/bin/snapdn",
    color="#9F9FC9",
    interval=300)

#status.register("shell",
#    command="/usr/local/bin/nixn",
#    interval=300)

#status.register("shell",
#    command="/usr/local/bin/marvinn",
#    interval=300)

# Not really useful now as I've ditched IceCat
#status.register("shell",
#    command="/usr/local/bin/icecatn",
#    interval=300)

# Too many updates for this to be worthwhile
#status.register("shell",
#    command="/usr/local/bin/guixn",
#    interval=300)

status.register("shell",
    command="/usr/local/bin/obss",
    color="#00AF0F",
    interval=300)

status.register("shell",
    command="/usr/local/bin/openrabn",
    color="#FFCCAA",
    interval=300)

status.register("shell",
    command="/usr/local/bin/openran",
    color="#FFFFAA",
    interval=300)

status.register("shell",
    command="/usr/local/bin/obsf",
    color="#A4AF4A",
    interval=300)

status.register("shell",
    command="/usr/local/bin/obsd",
    color="#FC6688",
    interval=300)

status.register("shell",
    command="/usr/local/bin/oscn",
    color="#FFFF00",
    interval=300)

    #color="#22FFAA",
status.register("shell",
    command="/usr/local/bin/jucippn",
    color="#F47444",
    interval=300)

status.register("shell",
    command="/usr/local/bin/jmoln",
    color="#A2F412",
    interval=300)

status.register("shell",
    command="/usr/local/bin/gsoftn",
    color="#CC32AA",
    interval=300)

status.register("shell",
    command="/usr/local/bin/codeliten",
    color="#22AF9F",
    interval=300)

status.register("shell",
    command="/usr/local/bin/atomn",
    color="#FFAA00",
    interval=300)

status.register("shell",
    command="/usr/local/bin/0adn",
    color="#AAFF0F",
    interval=300)

status.run()
