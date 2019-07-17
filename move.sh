#!/bin/sh

# Receives a filename as argument and moves it to a folder selecting it with fzf

filename="$1"
target="$(selectPathFzf.sh "Move to: ")"
mv "$filename" "$target"
