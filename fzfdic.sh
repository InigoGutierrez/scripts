#!/bin/sh

dict="$(printf "EN\nES" | fzf -e -i --prompt="Choose a dictionary>")"
if [ "$dict" = "EN" ]; then
	fzf -e -i --prompt="EN>" < /usr/share/dict/words.txt
elif [ "$dict" = "ES" ]; then
	fzf -e -i --prompt="ES>" < /usr/share/dict/palabras.txt
fi
