#!/usr/bin/env python3
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

status.register("clock",
    format="%a %d %b %y %r")

status.register("disk",
    path="/data",
    round_size=1,
    format="{used}/{total}G")

status.register("disk",
    path="/",
    round_size=1,
    format="{used}/{total}G")

status.register("mem",
    format="{used_mem}/{total_mem}G",
    color="#FFFFFF",
    divisor=1073741824,
    round_size=3)

status.register("load", format="{avg1}")

status.register("cpu_usage",
    format="{usage}%")

status.register("temp",
    hints={"markup": "pango"})

status.register("network", interface="wlo1", format_up="D{bytes_recv}KB/s U{bytes_sent}KB/s")

status.register("battery")

status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}',
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='ASXX0117:1:AS',
       # locale='en-AU',
        units="metric",
    ))

status.register("uptime",
    format="{hours}:{mins}:{secs}")

status.register("shell",
    command="/usr/local/bin/vscoden",
    interval=300)

status.register("shell",
    command="/usr/local/bin/vimn",
    interval=300)

status.register("shell",
    command="/usr/local/bin/swayn",
    interval=300)

status.register("shell",
    command="/usr/local/bin/nixn",
    interval=300)

status.register("shell",
    command="/usr/local/bin/marvinn",
    interval=300)

# Not really useful now as I've ditched IceCat
#status.register("shell",
#    command="/usr/local/bin/icecatn",
#    interval=300)

# Too many updates for this to be worthwhile
#status.register("shell",
#    command="/usr/local/bin/guixn",
#    interval=300)

status.register("shell",
    command="/usr/local/bin/atomn",
    interval=300)

status.run()
