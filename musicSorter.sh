#!/bin/sh

count=0
files="${1}/*.mp3"
for file in $files; do
	count=$(($count+1))
	echo "File $count: $file" >> "$1/filelist.txt"
	artist=$(tagmp3 show "$file" | grep "Artist" | cut -d' ' -f7- | xargs)
	if [ -n "$artist" ]; then
		if [ -z "$(ls $1 | grep "$artist")" ]; then
			mkdir -p "$1/$artist"
		fi
		target="$1/$artist/$(basename "$file")"
		mv -f "$file" "$target"
	fi
done
