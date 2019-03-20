#!/bin/sh

[ "$(pgrep -x musicMode.sh)" != "$$" ] && dunstify -t 3000 "Already running! Exiting this new instance." && exit 0 #Check if already running
[ -z "$(pgrep -x cmus)" ] && dunstify -t 3000 "cmus not running. Open it first." && exit 0 #Check that cmus is running

coverPath="/tmp/musicMode.png"

i3-msg "workspace 6" >/dev/null #Switch to music workspace
i3-msg "gaps inner current set 0; gaps outer current set 0; bar mode hide"
i3-msg "exec urxvt -title 'noborder' -sh 100 -fn xft:monospace:size=4 -e vis -c ~/.config/vis/configMusicMode" # Start music visualizer

# Loop checking current song and setting background
file=""
while [ true ]
do
	# Check if current file has changed
	if [ "$file" != "$(cmus-remote -Q | grep "^file" | cut -d' ' -f2-)" ]; then
		# Set $file to current playing file if it has changed
		file="$(cmus-remote -Q | grep ^file | cut -d' ' -f2-)"
		rm $coverPath >/dev/null
		# Get title. It is only used for video search.
		title="$(cmus-remote -Q | grep "^tag title " | cut -d' ' -f3-)"
		[ -z "$title" ] && title="$(basename "$(cmus-remote -Q | grep "^file" | cut -d' ' -f2- | cut -d'.' -f1 )")"
		dunstify -r $(dunstifyIDs.sh musicMode) -t 0 "$(~/scripts/i3blocks/i3music.sh)"
		ffmpeg -i "$file" "$coverPath" >/dev/null
		feh --no-fehbg --bg-max "$coverPath" >/dev/null #|| feh --no-fehbg --bg-max $HOME/images/wallpapers/bg_* >/dev/null
		videoFile="$(ls -d $HOME/videos/music/* | grep "$title")"
		if [ "$videoFile" ]; then # videoclip found
			cmus-remote -u
			mpv --fs "$videoFile"
			while [ "$(pgrep -x mpv)" ]
			do
				sleep 1
			done
			cmus-remote -n
		fi
	fi
	[ -z "$(pgrep -x cmus)" ] && closeMusicMode.sh
	sleep 1
done
