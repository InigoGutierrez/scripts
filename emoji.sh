#!/bin/sh

# Feeds an emoji list into dmenu and allows to select one into clipboard

file="$XDG_CONFIG_HOME/emoji"
selected="$(cat "$file" | dmenu -i -l 20 -p "Choose an emoji:" | cut -d' ' -f1)"
[ -z "$selected" ] && dunstify "No emoji selected." && exit 0
echo "$selected" | xsel -ib
dunstify "Copied $(xsel -ob)"
