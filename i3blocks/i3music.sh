#!/bin/sh

case $BLOCK_BUTTON in
	1) pgrep -x cmus >/dev/null && cmus-remote -r ;;
	2) pgrep -x cmus >/dev/null && cmus-remote -u ;;
	3) pgrep -x cmus >/dev/null && cmus-remote -n ;;
esac

symbol=🎵
pgrep -x cmus >/dev/null || exit 0
stat="$(cmus-remote -Q | grep "status " | awk '{print $2}')"
artist="$(cmus-remote -Q | grep "tag artist " | cut -d' ' -f3-)"
title="$(cmus-remote -Q | grep "tag title " | cut -d' ' -f3-)"
[ -z "$artist" ] && artist="(unknown)"
[ -z "$title" ] && title="[$(basename "$(cmus-remote -Q | grep "file " | cut -d'/' -f5-)")]"
if [ "$stat" = "playing" ]; then
	echo "$symbol $artist ─ $title"
elif [ "$stat" = "paused" ]; then
	echo "$symbol ( $artist ─ $title )"
else
	echo "$symbol $stat"
fi
