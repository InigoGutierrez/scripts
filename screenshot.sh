#!/bin/sh

# Takes a screenshot

name="$(date +"%y%m%d_%H%M%S")".png
file="$HOME/images/screenshots/""$name"
[ "$1" = "" ] && maim -m 8 $file && notify-send -t 800 "Screenshot $name taken."
[ "$1" = "-a" ] && maim -s -b 2 -c 0.412,0.431,1 -m 8 $file && notify-send -t 800 "Screenshot $name taken."
