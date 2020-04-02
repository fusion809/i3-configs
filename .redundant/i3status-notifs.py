#!/usr/bin/env python3
from i3pystatus import Status
from collections import defaultdict
from string import Formatter
from i3pystatus.weather import weathercom
from i3pystatus import IntervalModule

status = Status()

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/zshn",
    color="#FDCDD9",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/vscoden",
#    color="#9FC9FF",
#    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/vimn",
    color="#AACCFF",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/subln",
#    color="#FFFF44",
#    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/spglibn",
    color="#F9C755",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/snapdgn",
#    color="#33A0F0",
#    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/snapdn",
#    color="#AFAFEF",
#    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/rofin",
    color="#CCFFAA",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/ostreen",
#    color="#FF9F9F",
#    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrayn",
    color="#FFAAFF",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openravsn",
    color="#FAC90F",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrauran",
    color="#F3AC56",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrassn",
    color="#AACCFF",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openraspn",
    color="#AAFFFF",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrarvn",
    color="#AAFFCC",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openramwn",
    color="#AACCFF",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrakn",
    color="#FFCCAA",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openragn",
    color="#9FCF9F",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openradot5n",
    color="#AC9F20F",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openradn",
    color="#CAF20F",
    interval=300)
status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openradn",
    color="#CAF20F",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrad2n",
    color="#FAF695",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openracan",
    color="#F9A5CF",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openracn",
    color="#FFAACF",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openrabn",
    color="#FFCCAA",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openra2n",
    color="#FAB0D2",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/openraplusn",
    color="#FFAA99",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/notepadqqn",
    color="#CFCFCC",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/molen",
    color="#F3C200",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/libmsymn",
    color="#33F233",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/komodon",
#    color="#9FCCFF",
#    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/jupytern",
    color="#8EC756",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/jmoln",
    color="#A2F412",
    interval=300)

#status.register("shell",
#    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/flatn",
#    color="#4EC756",
#    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/avogadroln",
    color="#F3FF22",
    interval=300)

status.register("shell",
    command="/data/GitHub/mine/scripts/NixOS-scripts/.local/bin/avogadron",
    color="#F3C200",
    interval=300)

status.run()

