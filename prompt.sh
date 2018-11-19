#!/bin/bash
# A dmenu binary prompt script.
# Gives a dmenu prompt labeled with $1 to perform command $2.

[ $(echo -e "No\nYes" | dmenu -i -p "$1" \
-nb "#000000" \
-nf "#60ff00" \
-sb "#60f000" \
-sf "#000000") \
== "Yes" ] && $2
