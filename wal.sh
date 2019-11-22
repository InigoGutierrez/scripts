#!/bin/sh
#
# wal.sh
#
# Usage: wal.sh image
#
# Runs wal with argument image and compiles dmenu

[ -z "$1" ] && exit 1

image="$1"

wal -i "$image"
sudo make -C "/home/taamas/repos/dmenu/" install clean
