#!/bin/sh

notify-send -t 1400 "Ripping $1..."
java -jar ~/programs/ripme*.jar -u "$1" && notify-send "Finished ripping $1."
