#!/bin/sh

MARKFILE='/tmp/screenRec.mark'
recsFolder="$HOME/videos/recs"
# Check if already recording
if [ -e $MARKFILE ]; then
	stopScreenRecord.sh
else
	touch $MARKFILE
	mkdir -p "$recsFolder"
	filename=rec"$(date +"%y-%m-%d_%H-%M-%S")".mkv
	# also record microphone
	# ffmpeg -video_size "$(getResolution.sh)" -framerate 30 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i hw:0,0 "$HOME/videos/recs/$filename" &
	ffmpeg -video_size "$(getResolution.sh)" -framerate 30 -f x11grab -i :0.0 -vcodec libx264 "$recsFolder/$filename" &
	notify-send -t 1000 "Recording $filename"
	pkill -SIGRTMIN+13 i3blocks
fi
