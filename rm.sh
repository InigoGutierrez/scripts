#!/bin/sh

# Moves an element to a litter folder instead of permanently removing it

folder="$HOME/litter/"
[ -d "$folder" ] || mkdir "$folder"
for file in "$@"
do
	mv "$file" "$folder"
done
[ -n "$STATUS_BAR" ] && pkill -SIGRTMIN+14 "$STATUS_BAR"
