#!/bin/bash
hour=$(date +%H)
if [ $hour -gt 4 -a $hour -lt 7 ]; then
	feh --bg-scale ~/images/wallpapers/pkmduskbg.png
elif [ $hour -gt 6 -a $hour -lt 15 ]; then
	feh --bg-scale ~/images/wallpapers/pkmdaybg.png
elif [ $hour -gt 14 -a $hour -lt 17 ]; then
	feh --bg-scale ~/images/wallpapers/pkmduskbg.png
else
	feh --bg-scale ~/images/wallpapers/pkmnightbg.jpg
fi
