#!/bin/sh

case $BLOCK_BUTTON in
	1) notify-send -h string:x-canonical-private-synchronous:disk -t 3000 "$(df -h | grep ^/dev/sda8 | awk '{print "/: Used "$3"/"$2" ("$5")"}')"
esac

df -h | grep ^/dev/sda8 | awk '{print $4"/"$2}'
