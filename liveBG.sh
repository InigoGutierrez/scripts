#!/bin/sh

# Dependencies: feh

bgsFolder="/home/taamas/images/wallpapers/live/current/"
delay=0.2

while [ 1 ]; do
	for file in $(echo $bgsFolder*); do
		feh --bg-max "$file"
		sleep $delay
	done
done
exit 0
