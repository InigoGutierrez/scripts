#!/bin/sh

# Obtain an id from ~/.config/dunst/dunstifyIDs by grepping a word.
# Use with dunstify for autoreplacing notifications by string identifier.

configFile="$HOME/.config/dunst/dunstifyIDs"
[ ! -f "$configFile" ] && dunstify "'$configFile' missing!" && exit 1
id="$(grep "$1" <"$configFile" | awk '{print $2}')"
[ -z "$id" ] && dunstify "'$1' ID not set in '$configFile'" && exit 1
echo "$id"
