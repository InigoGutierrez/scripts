#!/bin/sh
configFile="$HOME/.config/barStatus"
[ ! -f "$configFile" ] && echo "1" >"$configFile"
if [ "$(cat "$configFile")" = "0" ]; then
	i3-msg bar mode dock
	echo "1" >"$configFile"
else
	i3-msg bar mode invisible
	echo "0" >"$configFile"
fi
