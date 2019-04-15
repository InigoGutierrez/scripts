#!/bin/sh

# Feeds an emoji list into dmenu and allows to select one into clipboard

file="$XDG_CONFIG_HOME/emoji"
selected="$(dmenu -i -l 20 -p "Choose an emoji:" < "$file" | cut -d' ' -f1 | tr -d '\n')"
[ -z "$selected" ] && dunstify -t 2000 "No emoji selected." && exit 0
echo "$selected" | xsel -ib
dunstify -t 2000 "Copied $(xsel -ob)"
