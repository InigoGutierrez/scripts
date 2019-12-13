#!/bin/sh

# ides.sh
#
# Usage: ides.sh
#
# Sets up a working environment (actually just selects from a list of scripts
# in a specific folder and executes one of them)

idesFolder="$HOME/.config/ides"
files="$(find "$idesFolder" | grep '\.sh$')"
names="$(echo "$files" | sed 's|^.*/||; s|\.sh$||')"
selectedName="$(echo "$names" | fzf)" || exit 0
selectedFile="$(echo "$files" | grep -E "${selectedName}(.sh)?$" )"

"$selectedFile"
