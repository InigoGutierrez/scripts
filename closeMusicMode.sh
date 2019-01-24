#!/bin/sh
kill $(pgrep -x musicMode.sh) # End the music mode process
i3-msg "bar mode dock" # Restore the i3bar
exec feh --bg-fill ~/images/wallpapers/bg* # Restore default wallpaper
notify-send -h string:x-canonical-private-synchronous:musicMode -t 1000 "Closed music mode."
