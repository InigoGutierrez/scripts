#!/bin/sh

outdir="/tmp/pdf"
opener="zathura"
name="${1%.*}"
ext="${1##*.}"

case "$ext" in
	"md")
		pandoc -s -o "$outdir/$name.pdf" "$1" 1>/dev/null 2>&1 ;;
	*)
		lowriter --convert-to pdf --outdir "$outdir" "$1" 1>/dev/null 2>&1 ;;
esac
"$opener" "$outdir/$name.pdf"
