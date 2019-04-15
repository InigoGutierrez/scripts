#!/bin/sh

if ! pgrep -x cmus ; then
	urxvt -title floating -sh 20 -geometry "185x15+30-28" -cd ~/music -e cmus
else
	cmus-remote -u
fi

pkill -SIGRTMIN+12 i3blocks
