#!/bin/sh

dict="$(printf "EN\nES" | fzf -e -i --prompt="Choose a dictionary>")"
if [ "$dict" = "EN" ]; then
	fzf -x -i --prompt="EN>" < "$CONFIG_DIC_EN"
elif [ "$dict" = "ES" ]; then
	fzf -x -i --prompt="ES>" < "$CONFIG_DIC_ES"
fi
