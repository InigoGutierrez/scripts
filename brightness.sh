#!/bin/bash

brightness_file=/sys/class/backlight/intel_backlight/brightness
maxbrightness_file=/sys/class/backlight/intel_backlight/max_brightness

brightness=$(< $brightness_file)
maxbrightness=$(< $maxbrightness_file)
let target=$1+$brightness
#for testing:
#echo "Actual bright: $brightness; Max: $maxbrightness; Target: $target"
if [ $target -gt $maxbrightness ]
then
	echo "Value too big. Target: $target; max: $maxbrightness"
elif [ 0 -gt $target ]
then
	echo "Value too low. Target: $target"
else
	echo $target | tee $brightness_file
	echo "New brightness: $target/$maxbrightness"
fi
