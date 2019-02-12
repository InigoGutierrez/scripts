#!/bin/sh

[ "$(pgrep -x musicMode.sh)" != "$$" ] && notify-send -t 3000 "Already running! Exiting this new instance." && exit 0 #Check if already running
[ -z "$(pgrep -x cmus)" ] && notify-send -t 3000 "cmus not running: No music mode." && exit 0 #Check that cmus is running

mkdir /tmp/musicMode
coverPath="/tmp/musicMode/cover.jpg"

i3-msg "workspace 6" >/dev/null #Switch to music workspace
i3-msg "gaps inner current set 0; gaps outer current set 0; bar mode hide"
i3-msg "exec urxvt -title 'noborder' -sh 100 -fn xft:monospace:size=4 -e vis -c ~/.config/vis/configMusicMode" # Start music visualizer

# Loop checking current song and checking background
file=""
while [ true ]
do
	if [ "$file" != "$(cmus-remote -Q | grep "^file" | cut -d' ' -f2-)" ]; then
		file="$(cmus-remote -Q | grep ^file | cut -d' ' -f2-)"
		rm $coverPath >/dev/null
		title="$(cmus-remote -Q | grep "tag title " | cut -d' ' -f3-)"
		[ -z "$title" ] && title="[$(basename "$(cmus-remote -Q | grep "file " | cut -d'/' -f5-)")]"
		notify-send -h string:x-canonical-private-synchronous:musicMode -t 0 "$(~/scripts/i3blocks/i3music.sh)"
		ffmpeg -i "$file" $coverPath >/dev/null
		feh --no-fehbg --bg-max $coverPath >/dev/null
		sleep 1
	fi
done
