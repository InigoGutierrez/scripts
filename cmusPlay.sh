#!/bin/sh

tmux=""
[ -f "/usr/bin/tmux" ] && tmux="tmux new-session -s cmus"
if ! pgrep -x cmus ; then
	urxvt -title floating -geometry "159x15+44+450" -cd ~/music -e $tmux cmus
else
	cmus-remote -u
fi

pkill -SIGRTMIN+12 i3blocks

