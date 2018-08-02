#!/usr/bin/env python3
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

status.register("clock",
    format="%a %-d %b %y %r")

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
    format="{Core_0}°C {Core_1}°C {Core_2}°C {Core_3}°C",
    hints={"markup": "pango"},
    lm_sensors_enabled=True,
    dynamic_color=True)

status.register("network", interface="wlp7s0", format_up="↓{bytes_recv}KB/s ↑{bytes_sent}KB/s")

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
    command="/usr/local/bin/obs-error",
    interval=300,
    color="#FAFBCC")

status.run()
