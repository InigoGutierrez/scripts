#!/bin/sh

notify-send -t 1400 "Ripping $1..."
java -jar "/home/taamas/programs/ripme.jar" -l "/home/taamas/images/rips" -u "$1" && dunstify "Finished ripping $1."
