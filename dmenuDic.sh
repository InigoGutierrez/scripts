#!/bin/sh

# Selects a word from a dictionary with the help of dmenu and copies it to clipboard.

dicES="$CONFIG_DIC_ES"
dicEN="$CONFIG_DIC_EN"
dicPL="$CONFIG_DIC_PL"
lines=10
dict="$(printf "EN\nES\nPL" | dmenu -i -p "Choose a dictionary:")"
if [ "$dict" = "ES" ]; then
	[ ! -f "$dicES" ] && dunstify "ES dic file ($dicES) does not exist." && exit 0
	word="$(dmenu -i -l $lines -p "Elige una palabra:" < "$dicES" )"
fi
if [ "$dict" = "EN" ]; then
	[ ! -f "$dicEN" ] && dunstify "EN dic file ($dicEN) does not exist." && exit 0
	word="$(dmenu -i -l $lines -p "Choose a word:" < "$dicEN")"
fi
if [ "$dict" = "PL" ]; then
	[ ! -f "$dicPL" ] && dunstify "PL dic file ($dicPL) does not exist." && exit 0
	word="$(dmenu -i -l $lines -p "Wybierz słowo:" <  "$dicPL")"
fi
[ "$word" ] || exit 0
echo "$word" | tr -d '\n' | xsel -bi
dunstify -t 2000 "Written [$word] into clipboard."
