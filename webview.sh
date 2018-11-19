#!/bin/bash

# Feed script a url.

ext="${1##*.}"
mpvFiles="mkv mp4 gif"
pqivFiles="png jpg jpeg jpe"
wgetFiles="mp3 pdf"

# Check youtube link
if echo "$1" | grep youtube > /dev/null; then
		nohup mpv --loop "$1" >/dev/null &
# General checks
elif echo $pqivFiles | grep -w $ext > /dev/null; then
		i3 exec pqiv "$1" >/dev/null &
elif echo $mpvFiles | grep -w $ext > /dev/null; then
		i3 exec mpv --loop "$1" >/dev/null &
elif echo $wgetFiles | grep -w $ext > /dev/null; then
		i3 exec wget "$1" >/dev/null &
else
		i3 exec qutebrowser "$1" >/dev/null &
fi
