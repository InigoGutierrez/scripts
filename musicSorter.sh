#!/bin/sh
#  __  __           _        ____             _
# |  \/  |_   _ ___(_) ___  / ___|  ___  _ __| |_ ___ _ __
# | |\/| | | | / __| |/ __| \___ \ / _ \| '__| __/ _ \ '__|
# | |  | | |_| \__ \ | (__   ___) | (_) | |  | ||  __/ |
# |_|  |_|\__,_|___/_|\___| |____/ \___/|_|   \__\___|_|
#

# Moves the mp3s in a given folder, creating a
# structure such as artist/album/file.
# Note: Some generated folder names might be wrong
# because of "tagmp3 show" not handling non-english
# characters correctly. Folder structure should be
# right nonetheless.

count=0
files="${1}/*.mp3"
for file in $files; do
	count=$(($count+1))
	echo "File $count: $file" >> "$1/filelist.txt"
	artist=$(tagmp3 show "$file" | grep --text "Artist" | cut -d' ' -f7- | sed 's/[[:space:]]*$//')
	echo "Artist: $artist" >> "$1/filelist.txt"
	if [ -n "$artist" ]; then
		if [ -z "$(ls "$1" | grep -w "$artist")" ]; then
			mkdir -p "$1/$artist"
		fi
		album=$(tagmp3 show "$file" | grep --text "Album" | cut -d' ' -f8- | sed 's/[[:space:]]*$//')
		echo "Album: $album" >> "$1/filelist.txt"
		if [ -n "$album" ]; then
			if [ -z "$(ls "$1/$artist" | grep -w "$album")" ]; then
				mkdir -p "$1/$artist/$album"
			fi
			target="$1/$artist/$album/$(basename "$file")"
		else
			target="$1/$artist/$(basename "$file")"
		fi
		mv -f "$file" "$target"
	fi
done
