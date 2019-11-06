#!/bin/sh

# i3weather.sh (i3blocks weather module)
#
# Usage: i3weather.sh
#
# Prints a one-line current weather report

#case $BLOCK_BUTTON in
#	1) # Left click
#	2) # Middle click
#	3) # Right click
#esac

output="$(curl 'wttr.in/Oviedo?format=%c+%t+%p+%w' | sed 's/+//g')"
echo ${output% k*}
