#!/bin/sh

# Receives filenames as arguments and copies them to a folder selected with fzf

target="$(selectPathFzf.sh "Copy to: ")"
cp "$@" "$target"
