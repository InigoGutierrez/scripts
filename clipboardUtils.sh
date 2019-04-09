#!/bin/bash

# Manipulate the X selection
# Dependencies: dmenu, xsel

options="Show selections\nReplicate selections\nWrite to selection"
target="$(echo -e "$options" | dmenu -l 3 -i -p "~ Clipboard utils ~")"
[ "$target" = "" ] && exit 0
case "$target" in
	"Show selections") notify-send "Clipboard: [$(xsel -bo)]
Primary: [$(xsel -po)]
Secondary: [$(xsel -so)]" ;;
	"Replicate selections")
		fromSelection="$(echo -e "Clipboard\nPrimary\nSecondary" | dmenu -l 3 -i -p "From selection:")"
		[ "$fromSelection" = "" ] && exit 0
		case "$fromSelection" in
			"Clipboard") fromOption=b ;;
			"Primary")  fromOption=p ;;
			"Secondary") fromOption=s ;;
		esac
		toSelection="$(echo -e "Clipboard\nPrimary\nSecondary" | dmenu -l 3 -i -p "To selection:")"
		[ "$toSelection" = "" ] && exit 0
		case "$toSelection" in
			"Clipboard") toOption=b ;;
			"Primary")  toOption=p ;;
			"Secondary") toOption=s ;;
		esac
		xsel -"$fromOption"o | xsel -"$toOption"i && notify-send "Copied [$(xsel -"$toOption"o)] from $fromSelection to $toSelection." ;;
	"Write to selection")
		selectedSelection="$(echo -e "Clipboard\nPrimary\nSecondary" | dmenu -l 3 -i -p "Write to which selection?")"
		textToWrite="$(dmenu -p "Text to write to $selectedSelection:")"
		[ "$textToWrite" = "" ] && exit 0
		case "$selectedSelection" in
			"Clipboard") echo "$textToWrite" | xsel -bi ;;
			"Primary")  echo "$textToWrite" | xsel -pi ;;
			"Secondary") echo "$textToWrite" | xsel -si ;;
		esac
		notify-send "Written [$textToWrite] to $selectedSelection." ;;
esac
