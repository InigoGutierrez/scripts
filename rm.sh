#!/bin/sh

# Moves an element to a litter folder instead of permanently removing it

folder="$HOME/litter/"
[ -d "$folder" ] || mkdir "$folder"
mv "$1" "$folder"
pkill -SIGRTMIN+14 i3blocks
