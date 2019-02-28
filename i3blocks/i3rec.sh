#!/bin/sh

# Shows status of ffmpeg screen recording

#case $BLOCK_BUTTON in
#	1) # Left click
#	2) # Middle click
#	3) # Right click
#esac

MARKFILE='/tmp/screenRec.mark'
[ -e $MARKFILE ] && echo "🎥✔️" && exit 0
echo ""
