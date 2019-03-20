#!/bin/sh
kill "$(pgrep -x "musicMode.sh")" # End the music mode process
i3-msg "bar mode dock" # Restore the i3bar
feh --bg-max ~/images/wallpapers/bg_* # Restore default wallpaper
killall vis
dunstify -r "$(dunstifyIDs.sh "musicMode")" -t 1000 "Closed music mode."
