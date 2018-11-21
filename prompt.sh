#!/bin/bash
# A dmenu binary prompt script.
# Gives a dmenu prompt labeled with $1 to perform command $2.

[ $(echo -e "No\nYes" | dmenu -i -p "$1") \
== "Yes" ] && $2
