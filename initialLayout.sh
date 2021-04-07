#!/bin/sh

hdmiConnected=""
xrandr | grep 'HDMI.* connected' && hdmiConnected="y"

if [ -n "$hdmiConnected" ]; then

	"$HOME/.screenlayout/hdmi1080p.sh"

	if pgrep -x bspwm; then
		bspc monitor -f HDMI-1-1
	fi

	if pgrep -x i3; then
		i3-msg focus left
		i3-msg workspace 3:👾
		i3-msg focus right
	fi

fi

pgrep -x bspwm && bspc desktop -l monocle
urxvt -e tmux new -s main &

if pgrep -x i3 && [ -n "$hdmiConnected" ]; then
	sleep 1
	i3-msg move workspace number 1:💻
	i3-msg workspace number 1:💻
fi
