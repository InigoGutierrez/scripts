#!/bin/bash

if ! pgrep -x cmus ; then
	urxvt -title floating -sh 20 -geometry "150x12+5-8" -cd ~/music -e cmus
else
	cmus-remote -u
fi
