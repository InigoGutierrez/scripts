#!/bin/sh
sink="$(pactl list sinks | grep "^Sink " | cut -d'#' -f2)"
if [ "$1" = "mute" ]; then
	pactl set-sink-mute "$sink" toggle
else
	pactl set-sink-volume "$sink" "$1%"
fi

dunstify -r "$(dunstifyIDs.sh "vol")" -t 500 "$(~/scripts/i3blocks/i3vol.sh)"
pkill -SIGRTMIN+10 i3blocks
