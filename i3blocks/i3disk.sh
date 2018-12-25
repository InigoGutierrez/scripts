#!/bin/sh

case $BLOCK_BUTTON in
		1) notify-send "$(df -h | grep ^/dev/sda6 | awk '{print "/: Used "$3"/"$2" ("$5")"}')"
#	2) # Middle click
#	3) # Right click
esac

df -h | grep ^/dev/sda6 | awk '{print $4"/"$2}'
