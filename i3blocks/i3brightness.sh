#!/bin/sh

value=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
echo "☀️$(($(($value*100))/$max))%"
