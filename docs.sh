#!/bin/sh
#
# docs.sh
#
# Usage: docs.sh
#
# Opens a pdf's specific page with zathura using a references file
# The syntax of the references file must be:
# Name#Absolute path to pdf#Page number
# The only character with any logic is #, used to separate fields
# Name can be anything and is just used for selection with dmenu

referencesFile="$HOME/.config/zathura/refs"
lines="$(wc -l "$referencesFile")"
if reference="$(cut -d# -f1 <"$referencesFile" |
	dmenu -i -l "$lines" -p "Reference: ")"; then
	line="$(grep "$reference" "$referencesFile" | sed q)"
	file="$(echo "$line" | cut -d# -f2)"
	page="$(echo "$line" | cut -d# -f3)"
	zathura -P "$page" "$file" &
fi
