#!/bin/sh

# Selects a word from the system's dictionary with the help of dmenu and copies it to clipboard.

word="$(dmenu -i -l 10 -p "Choose a word:" < /usr/share/dict/cracklib-small)"
[ "$word" ] || exit 0
echo "$word" | xsel -bi
dunstify -t 2000 "Written [$word] into clipboard."
