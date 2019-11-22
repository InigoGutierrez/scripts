#!/bin/bash
#
# pdfSxiv.sh
#
# Usage: pdfSxiv.sh FILE
#
# Opens all images of a pdf with sxiv

[ -z "$1" ] && exit 1

baseDir="/tmp/pdfSxiv"
directory="${1##*/}"
directory="${directory%%.*}"
fullPath="${baseDir}/001-${directory}"
if [ -d "$fullPath" ]; then
	last="$(ls "${fullPath}/.." | sort | tail -n 1)"
	last="${last%%-*}"
	while echo "$last" | grep -E -q '^0'; do
		last="${last#0}"
	done
	index="$((last+1))"
	while ! echo "$index" | grep -E -q '.{3}'; do
		index="0$index"
	done
	fullPath="${baseDir}/${index}-${directory}"
fi

mkdir -p "$fullPath"
pdfimages -png "$1" "${fullPath}/pdfSxiv"
sxiv "${fullPath}"/*
