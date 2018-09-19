#!/usr/bin/env python3
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

status.register("clock",
    format="%A %d %B %Y %r")

status.register("disk",
    path="/data",
    round_size=1,
    format="/data {used}/{total}G")

status.register("disk",
    path="/",
    round_size=1,
    format="/ {used}/{total}G")

status.register("mem",
    format="RAM {used_mem}/{total_mem}G",
    color="#FFFFFF",
    divisor=1073741824,
    round_size=3)

status.register("load", format="Load {avg1}")

status.register("cpu_usage",
    format="CPU {usage}%")

status.register("network", interface="enp24s0", format_up="↓{bytes_recv}KB/s ↑{bytes_sent}KB/s")

status.register("pulseaudio")

status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}',
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='ASXX0117:1:AS',
        units="metric",
    ))

status.register("uptime",
    format="Up {hours}:{mins}:{secs}")

status.register("shell",
    command="/usr/local/bin/obs-error",
    color="#F3AC29",
    interval=300)

status.register("github",
    access_token="4a4b27082a611a9fa24c432a14d43da6cb7268b2",
    format='{status}, unread {unread}')

status.run()
