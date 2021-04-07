#!/bin/sh

# Takes a screenshot

borderColor="0.412,0.431,1"
name="$(date +"%y%m%d_%H%M%S")".png
file="$HOME/images/screenshots/""$name"

# If secondary screen is connected take a screenshot of only it
geometry=""
if xrandr | grep -q '^HDMI-1-1'; then
	g="$(xrandr | grep '^HDMI-1-1' | cut -d' ' -f3)"
	geometry="-g $g"
fi

[ "$1" = "" ] && maim -u -m 8 $geometry "$file" && notify-send -t 800 "Screenshot $name taken."
[ "$1" = "-a" ] && maim -u -s -b 2 -c "$borderColor" -m 8 "$file" && notify-send -t 800 "Screenshot $name taken."
[ "$1" = "-c" ] && maim -u -s -b 2 -c "$borderColor" -m 8 | xclip -selection clipboard -t image/png && notify-send -t 800 "Screenshot copied to clipboard."
