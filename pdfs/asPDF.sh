#!/bin/sh

outdir="/tmp/pdf"
name="${1%.*}"
ext="${1##*.}"
[ -d "$outdir" ] || mkdir -p "$outdir"

case "$ext" in
	"md")
		pandoc -s -o "$outdir/$name.pdf" "$1" 1>/dev/null 2>&1 ;;
	*)
		lowriter --convert-to pdf --outdir "$outdir" "$1" 1>/dev/null 2>&1 ;;
esac
"$READER" "$outdir/$name.pdf"
