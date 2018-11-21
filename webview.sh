#!/bin/bash

# Feed script a url.

ext="${1##*.}"
mpvFiles="mkv mp4 gif"
pqivFiles="png jpg jpeg jpe"
wgetFiles="mp3 pdf"

# Check youtube link
if echo "$1" | grep youtube > /dev/null; then
		chosen=$(echo -e "mpv\nmpv (loop)\nmpv (float)\nqutebrowser" | dmenu -i)
		case "$chosen" in
			mpv) nohup mpv "$1" >/dev/null & ;;
			"mpv (loop)") nohup mpv --loop "$1" >/dev/null & ;;
			"mpv (float)") bash ~/scripts/mpvFloat.sh "$1" ;;
			qutebrowser) qutebrowser "$1" & ;;
		esac
# General checks
elif echo $pqivFiles | grep -w $ext > /dev/null; then
		nohup pqiv -i -P "0,0" -T "pqivfloat" "$1" >/dev/null &
elif echo $mpvFiles | grep -w $ext > /dev/null; then
		chosen=$(echo -e "mpv\nmpv (loop)\nqutebrowser" | dmenu -i)
		case "$chosen" in
			mpv) nohup mpv "$1" >/dev/null & ;;
			"mpv (loop)") nohup mpv --loop "$1" >/dev/null & ;;
			"mpv (float)") bash ~/scripts/mpvFloat.sh "$1" ;;
			qutebrowser) qutebrowser "$1" & ;;
		esac
elif echo $wgetFiles | grep -w $ext > /dev/null; then
		i3 exec wget "$1" >/dev/null &
else
		chosen=$(echo -e "mpv\nmpv (loop)\npqiv\nqutebrowser" | dmenu -i)
		case "$chosen" in
			mpv) nohup mpv "$1" >/dev/null & ;;
			"mpv (loop)") nohup mpv --loop "$1" >/dev/null & ;;
			"mpv (float)") bash ~/scripts/mpvFloat.sh "$1" ;;
			qutebrowser) qutebrowser "$1" & ;;
			pqiv) nohup pqiv -i -P "0,0" -T "pqivfloat" "$1" >/dev/null & ;;
		esac
fi
