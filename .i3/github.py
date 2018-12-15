#!/run/current-system/sw/bin/python3
from i3status import status

status.register("github",
    access_token="63d95eaa33f1f2ecbfcadf40e12c623b424d6b77",
    format="Unread {unread}")

status.run()
