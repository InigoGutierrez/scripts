#!/bin/sh

# Generates an i3lock bg based on a screenshot.

#imgLock="$HOME/images/icons/lock.png"
imgTemp="/tmp/i3lockss.png"
imgFinal="/tmp/lockFinal$(date +"%H%M%S").png"
maim -u "$imgTemp"
#[ -e "$imgLock" ] && convert "$imgTemp" -paint 1 -swirl -30 "$imgLock" -gravity center -composite "$imgFinal"
#[ -e "$imgLock" ] && convert "$imgTemp" "$imgLock" -gravity center -composite -monochrome "$imgFinal"
#convert "$imgTemp" -canny 1x1 +level-colors "#093145","#e0ea99" "$imgFinal"
#convert "$imgTemp" -type Grayscale -paint 1 "$imgFinal"
#convert "$imgTemp" -colors 2 -mode 2x5 "#00001f,000000" "$imgFinal"
#convert "$imgTemp" -median 10x5 "#00001f,000000" "$imgFinal"
#convert "$imgTemp" -polaroid 0 +level-colors "#00001f,000000" "$imgFinal"
#convert "$imgTemp" -colors 2 -motion-blur 5x5 +level-colors "#00001f,000000" "$imgFinal"
convert "$imgTemp" -median 2x2 -colors 8 "$imgFinal"
i3lock -i "$imgFinal" -f || i3lock -i "$imgTemp" -f
