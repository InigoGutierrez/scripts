#!/bin/bash

case $BLOCK_BUTTON in
	1) cmus-remote -r ;;
	2) cmus-remote -u ;;
	3) cmus-remote -n ;;
esac

status=$(cmus-remote -Q | grep status | awk '{print $2}')
artist=$(cmus-remote -Q | grep "tag artist " | cut -d' ' -f3-)
title=$(cmus-remote -Q | grep "tag title " | cut -d' ' -f3-)
[ -z $artist ] && artist="(unknown)"
[ -z $title ] && title=$(cmus-remote -Q | grep "file " | cut -d'/' -f5-)
if [ $status = "playing" ]; then
	echo "$artist ─ $title"
elif [ $status = "paused" ]; then
	echo "( $artist ─ $title )"
else
	echo "$status"
fi
