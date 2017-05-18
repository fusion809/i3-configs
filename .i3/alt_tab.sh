#!/bin/bash
# This file is part of Danil <danil@kutkevich.org> home.

id=`python ~/.i3/id_list.py`
i3-msg [id="$id"] focus > /dev/null
