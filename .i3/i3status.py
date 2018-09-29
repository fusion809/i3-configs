#!/usr/local/bin/env python3
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

status.register("clock",
    format="%A %d %B %Y %r")

status.register("shell",
    command="/usr/local/bin/disk",
    color="#fffffff",
    interval=10)

status.register("shell",
    command="/usr/local/bin/ram",
    color="#fcfcff",
    interval=20)

status.register("shell",
    command="/usr/local/bin/av-temp",
    color="#ffaacc",
    interval=20)

status.register("shell",
    command="/usr/local/bin/cpu",
    color="#ffaaff",
    interval=20)

status.register("shell",
    command="/usr/local/bin/UP",
    color="#aaffaa",
    interval=20)

status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}',
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='ASXX0117:1:AS',
        units="metric",
    ))
