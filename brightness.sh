#!/bin/sh

brightness_file="/sys/class/backlight/intel_backlight/brightness"
maxbrightness_file="/sys/class/backlight/intel_backlight/max_brightness"

# Old setup with initial file permissions change
# permissions="$(ls -l $brightness_file | awk '{print $1}')"
# if [ $permissions != "-rw-rw-rw-" ]; then
# 	sudo ~/scripts/brightFirst.sh
# fi

brightness="$(cat "$brightness_file")"
maxbrightness="$(cat "$maxbrightness_file")"
target=$(($1+brightness))
if [ $target -gt "$maxbrightness" ]
then
	echo "$maxbrightness" | sudo tee "$brightness_file"
elif [ 0 -gt "$target" ]
then
	echo "0" | sudo tee "$brightness_file"
else
	echo "$target" | sudo tee "$brightness_file"
fi

dunstify -r "$(dunstifyIDs.sh "brightness")" -t 500 "$(~/scripts/i3blocks/i3brightness.sh)"
pkill -SIGRTMIN+11 i3blocks
