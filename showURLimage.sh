#!/bin/sh

# Downloads an url to /tmp and opens it with sxiv.
# If the url is from youtube tries to download the thumbnail.

folder="/tmp/showURLimage"
filename="${folder}/$(date +%H%M%S)"

url="$1"

[ -d "$folder" ] || mkdir -p "$folder"

if echo "$url" | grep -i "youtube" >/dev/null; then
	youtube-dl --skip-download --write-thumbnail --no-playlist -o "$filename" "$url"
	convert "${filename}*" "${filename}.jpg"
	filename="${filename}.jpg"
else
	curl "$url" > "$filename"
fi

sxiv -b -N "sxivfloat" "$filename" || notify-send "No image found at $url"
