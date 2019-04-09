#!/bin/sh

# Generates an i3lock bg based on a screenshot.

imgLock="$HOME/images/icons/lock.png"
imgTemp="/tmp/i3lockss.png"
imgFinal="/tmp/lockFinal$(date +"%H%M%S").png"
maim "$imgTemp"
[ -e "$imgLock" ] && convert "$imgTemp" -paint 1 -swirl -30 "$imgLock" -gravity center -composite "$imgFinal"
i3lock -i "$imgFinal" -f || i3lock -i "$imgTemp" -f
