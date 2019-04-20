#!/bin/sh

dict="$(printf "EN\nES" | fzf -e --prompt="Choose a dictionary>")"
if [ "$dict" = "EN" ]; then
	fzf -e --prompt="EN" < /usr/share/dict/words.txt
elif [ "$dict" = "ES" ]; then
	fzf -e --prompt="ES" < /usr/share/dict/palabras.txt
fi
