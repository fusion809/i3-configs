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

status.register("shell",
    command="/data/GitHub/mine/scripts/nixos-scripts/.local/bin/rfs-usage",
    color="#FFFFFF",
    interval=60)

status.register("mem",
    format="RAM {used_mem}/{total_mem}G",
    color="#FFFFFF",
    divisor=1073741824,
    round_size=3)

status.register("load", format="Load {avg1}")

status.register("cpu_usage",
    format="CPU {usage}%")

status.register("network", interface="enp24s0", format_up="↓{bytes_recv}KB/s ↑{bytes_sent}KB/s")

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
    command="/data/GitHub/mine/scripts/nixos-scripts/.local/bin/obs-error",
    color="#F3AC29",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/nixos-scripts/.local/bin/tville-weather",
#    color="#AAFFFF",
#    interval=1800)

status.register("shell",
    command="/data/GitHub/mine/scripts/nixos-scripts/.local/bin/operating-system",
    color="#FFCA99",
    interval=10000000)

status.run()
