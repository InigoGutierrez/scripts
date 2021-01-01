#!/bin/sh

markfile='/tmp/screenRec.mark'
recsFolder="$HOME/videos/recs"

# Check if already recording
[ -e "$markfile" ] && stopScreenRecord.sh && exit 0

touch "$markfile"
[ ! -d "$recsFolder" ] && mkdir -p "$recsFolder"

filename="rec$(date +"%y-%m-%d_%H-%M-%S").mkv"

screenRes="$(getResolution.sh)"
screenPos=":0.0+0,0"

if [ "$(getResolution.sh | wc -l)" != 1 ]; then
	screenRes="$(getResolution.sh | grep '1920x')"
	screenPos=":0.0$(xrandr | grep -E "${screenRes}.*\(normal" | grep -Eo '\+[0-9]+\+[0-9]+')"
fi

# also record microphone
# ffmpeg -video_size "$(getResolution.sh)" -framerate 30 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i hw:0,0 "$HOME/videos/recs/$filename" &
 ffmpeg -video_size "$screenRes" -framerate 25 -f x11grab -i "$screenPos" -f pulse -ac 2 -i default -vcodec libx264 "${recsFolder}/${filename}" &
 notify-send -t 1000 "Recording $filename"
 pkill -SIGRTMIN+13 i3blocks
