#!/bin/sh

# i3corona.sh
#
# Shows daily stats about coronavirus in Spain

#case $BLOCK_BUTTON in
#	1) # Left click
#	2) # Middle click
#	3) # Right click
#esac

tmpDir="/tmp/corona"
tmpFile="${tmpDir}/coronaData.txt"

[ -d "$tmpDir" ] || mkdir -p "$tmpDir"
[ -f "$tmpFile" ] ||
	curl https://corona-stats.online/spain > "$tmpFile" 2>/dev/null

grep 'Spain' "$tmpFile" | sed 's/\s*//g; s/\x1b\[[0-9;]*m//g; s/[,▲║]//g' |
	awk -F'│' '{print "😷 " $3 " (+" $4 ") 💪 " $7}'

