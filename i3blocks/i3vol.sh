#!/bin/bash
vol=$(pactl list sinks | grep Volumen: | awk '{print $5}')
mute=$(pactl list sinks | grep Silencio: | cut -d' ' -f2)
if [ $mute = "no" ]; then
	echo "🔊 $vol"
else
	echo "🔇($vol)"
fi
