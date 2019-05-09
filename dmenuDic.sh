#!/bin/sh

# Selects a word from a dictionary with the help of dmenu and copies it to clipboard.

dict="$(printf "EN\nES\nPL" | dmenu -i -p "Choose a dictionary:")"
if [ "$dict" = "EN" ]; then
	word="$(dmenu -i -l 10 -p "Choose a word:" < /usr/share/dict/words.txt)"
elif [ "$dict" = "ES" ]; then
	word="$(dmenu -i -l 10 -p "Elige una palabra:" < /usr/share/dict/palabras.txt)"
elif [ "$dict" = "PL" ]; then
	word="$(dmenu -i -l 10 -p "Wybierz słowo:" < /usr/share/dict/słowa.txt)"
fi
[ "$word" ] || exit 0
echo "$word" | tr -d '\n' | xsel -bi
dunstify -t 2000 "Written [$word] into clipboard."
