#!/bin/sh

# Sets a random image as wallpaper and soft-links it from home folder.

bgsFolder="$CONFIG_FOLDER_RANDOMBG"
[ -z "$bgsFolder" ] && dunstify '$CONFIG_FOLDER_RANDOMBG env variable not set.' && exit 0
[ ! -d "$bgsFolder" ] && dunstify "'$CONFIG_FOLDER_RANDOMBG' folder does not exist." && exit 0
wpFile="$(ls -d "$CONFIG_FOLDER_RANDOMBG"/* | shuf -n 1)"
feh --bg-max "$wpFile"
ln -sf "$wpFile" "${HOME}/wp"
