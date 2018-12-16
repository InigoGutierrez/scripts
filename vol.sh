#!/bin/bash
sink=$(pactl list sinks | grep "Receptor " | cut -d'#' -f2)
if [ $1 = "mute" ]; then
	pactl set-sink-mute $sink toggle
else
	pactl set-sink-volume $sink $1%
fi

notify-send -t 500 "$(~/scripts/i3blocks/i3vol.sh)"
pkill -SIGRTMIN+10 i3blocks
