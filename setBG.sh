#!/bin/sh

# Sets an image as wallpaper and sends a confirmation notification.

bgiconPath="/tmp/bgicon"
convert "$1" -resize 64x64 "$bgiconPath"
feh --bg-max "$1" && notify-send -t 3000 -i "$bgiconPath" "$1 set as background."
