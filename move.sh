#!/bin/sh

# Receives filenames as arguments and moves them to a folder selected with fzf

target="$(selectPathFzf.sh "Move to: ")"
mv "$@" "$target"
