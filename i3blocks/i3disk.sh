#!/bin/sh

case $BLOCK_BUTTON in
	1)
		root="$(df -h | grep /$ | awk '{print "/: Used "$3"/"$2" ("$5")"}')"
		home="$(df -h | grep /home$ | awk '{print "/home: Used "$3"/"$2" ("$5")"}')"
		notify-send -h string:x-canonical-private-synchronous:disk -t 5000 "$root
$home" ;;
esac

df -h | grep "/home$" | awk '{print $4"/"$2}'
