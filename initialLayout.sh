#!/bin/sh

if pgrep -x i3 && xrandr | grep 'HDMI.* connected'; then
	i3-msg focus left
	i3-msg workspace 3:👾
	i3-msg focus right
fi

urxvt -e tmux new -s main &
sleep 1

if pgrep -x i3 && xrandr | grep 'HDMI.* connected'; then
	i3-msg move workspace number 1:💻
	i3-msg workspace number 1:💻
fi
