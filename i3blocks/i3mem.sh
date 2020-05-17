#!/bin/sh

case $BLOCK_BUTTON in
	1) dunstify -r $(dunstifyIDs.sh "memory") -t 5000 "Highest RAM processes:
$(ps axch -o cmd:18,%mem --sort=-%mem | sed 10q)" ;;
esac

free -h | awk '/^Mem/ {print $3 "/" $2}'
free -h | awk '/^Mem/ {print $3}'
