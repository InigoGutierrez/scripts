#!/bin/bash
if [ $1 = "mute" ]; then
	pactl set-sink-mute 0 toggle
else
	pactl set-sink-volume 0 $1%
fi

notify-send -t 500 "$(~/scripts/i3blocks/i3vol.sh)"
pkill -SIGRTMIN+10 i3blocks
