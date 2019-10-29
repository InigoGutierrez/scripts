#!/bin/sh

# Downloads an url to /tmp and opens it with sxiv.

filename="/tmp/showURLimage$(date +%H%M%S)"
curl "$1" > "$filename"
sxiv -b -N "sxivfloat" "$filename" || notify-send "No image found at $1"
