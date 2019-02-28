#!/bin/sh

MARKFILE='/tmp/screenRec.mark'
# Check if already recording
if [ -e $MARKFILE ]; then
	stopScreenRecord.sh
else
	touch $MARKFILE
	filename=rec"$(date +"%y-%m-%d_%H-%M-%S")".mp4
	# also record microphone
	# ffmpeg -video_size "$(getResolution.sh)" -framerate 30 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i hw:0,0 "$HOME/videos/recs/$filename" &
	ffmpeg -video_size "$(getResolution.sh)" -framerate 30 -f x11grab -i :0.0+0,0 "$HOME/videos/recs/$filename" &
	notify-send -t 1000 "Recording $filename"
	pkill -SIGRTMIN+13 i3blocks
fi
