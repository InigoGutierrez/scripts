#!/bin/sh

# Downloads an url to /tmp and opens it with sxiv.
# If the url is from youtube tries to download the thumbnail.

url="$1"
echo "$url" | grep -i "youtube" >/dev/null &&
	url="$(youtube-dl --get-thumbnail "$url")"

folder="/tmp/showURLimage"
filename="${folder}/$(date +%H%M%S)"

[ -d "$folder" ] || mkdir -p "$folder"
curl "$url" > "$filename"
sxiv -b -N "sxivfloat" "$filename" || notify-send "No image found at $url"

