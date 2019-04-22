#!/bin/sh
if [ "$(date +%H)" -gt 18 ]
then
	feh --bg-scale ~/images/wallpapers/night*
else
	feh --bg-scale ~/images/wallpapers/bg*
fi
