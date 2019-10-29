#!/bin/sh

# Sets a random image as wallpaper.

bgsFolder="$CONFIG_FOLDER_RANDOMBG"
[ -z "$bgsFolder" ] && dunstify '$CONFIG_FOLDER_RANDOMBG env variable not set.' && exit 0
[ ! -d "$bgsFolder" ] && dunstify "'$CONFIG_FOLDER_RANDOMBG' folder does not exist." && exit 0
feh --bg-max "$(ls -d "$CONFIG_FOLDER_RANDOMBG"/* | shuf -n 1)"
