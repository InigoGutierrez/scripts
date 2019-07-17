#!/bin/sh

# Receives a filename as argument and copies it to a folder selecting it with fzf

filename="$1"
target="$(selectPathFzf.sh "Copy to: ")"
cp "$filename" "$target"
