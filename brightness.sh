#!/bin/sh

brightness_file="/sys/class/backlight/intel_backlight/brightness"
maxbrightness_file="/sys/class/backlight/intel_backlight/max_brightness"

# Old setup with initial file permissions change
# permissions="$(ls -l $brightness_file | awk '{print $1}')"
# if [ $permissions != "-rw-rw-rw-" ]; then
# 	sudo ~/scripts/brightFirst.sh
# fi

brightness=$(< "$brightness_file")
maxbrightness=$(< "$maxbrightness_file")
let target=$1+$brightness
sudo chmod 666 /sys/class/backlight/intel_backlight/brightness
if [ $target -gt $maxbrightness ]
then
	sudo echo "$maxbrightness" >"$brightness_file"
elif [ 0 -gt $target ]
then
	sudo echo "0" >"$brightness_file"
else
	sudo echo "$target" >"$brightness_file"
fi
sudo chmod 644 /sys/class/backlight/intel_backlight/brightness

dunstify -r $(dunstifyIDs.sh "brightness") -t 500 "$(~/scripts/i3blocks/i3brightness.sh)"
pkill -SIGRTMIN+11 i3blocks
