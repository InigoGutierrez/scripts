#!/bin/bash

case $BLOCK_BUTTON in
	1) i3-msg "exec urxvt -e alsamixer" >/dev/null ;;
	3) pgrep -x dunst >/dev/null && notify-send -t 2000 "Click for alsamixer" ;;
esac

vol=$(pactl list sinks | grep Volumen: | awk '{print $5}')
mute=$(pactl list sinks | grep Silencio: | cut -d' ' -f2)
if [ $mute = "no" ]; then
	echo "🔊 $vol"
else
	echo "🔇($vol)"
fi
