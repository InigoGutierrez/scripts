#!/bin/bash

status=$(cmus-remote -Q | grep status | awk '{print $2}')
if [ $status = "playing" ]; then
	artist=$(cmus-remote -Q | grep "tag artist " | cut -d' ' -f3-)
	title=$(cmus-remote -Q | grep "tag title " | cut -d' ' -f3-)
	[ -z $artist ] && artist="(unknown)"
	[ -z $title ] && title=$(cmus-remote -Q | grep "file " | cut -d'/' -f5-)
	echo "$artist ─ $title"
else
	echo "$status"
fi
