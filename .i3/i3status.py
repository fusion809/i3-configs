#!/usr/bin/env python2
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %y %r",)

status.register("mem", 
    format="RAM: {used_mem}/{total_mem} GiB", 
    color="#FFFFFF", 
    divisor=1073741824,
    round_size=3
    )

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load", format="Load: {avg1}")

status.register("cpu_usage",
    format="CPU: {usage}%",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{Core_0}°C {Core_1}°C {Core_2}°C {Core_3}°C",
    hints={"markup": "pango"},
    lm_sensors_enabled=True,
    dynamic_color=True
   )

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    round_size=1,
    format="Disk: {used}/{total}G",)

status.register("uptime",
    format="Up: {hours}h {mins}m {secs}s")

status.register("network", interface="wlo1")

status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}',
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='ASXX0117:1:AS',
        units="metric",
    ),
)

status.run()
