#!/bin/sh
#
# toPDF.sh
#
# Usage: toPDF.sh [-o] INPUTFILE
#
# Compiles a file to a temporal PDF using pandoc, updating the temporal file if
# it already exists.
# Opens the file with $READER if -o option is given.

open=""
if [ "$1" = "-o" ]; then
	open="1"
	shift
fi

[ -z "$1" ] && exit 1

targetDir="/tmp/toPDF"
sourceFile="$1"
targetFile="${targetDir}/${sourceFile##*/}"
targetFile="${targetFile%.*}.pdf"

[ -d "$targetDir" ] || mkdir -p "$targetDir"
pandoc "$sourceFile" -o "$targetFile"
[ -n "$open" ] && "$READER" "$targetFile" &
