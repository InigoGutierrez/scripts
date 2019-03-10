#!/bin/sh

# Takes a screenshot

name="$(date +"%y%m%d_%H%M%S")".png
file="$HOME/images/screenshots/""$name"
maim -m 8 $file && notify-send -t 800 "Screenshot $name taken."
