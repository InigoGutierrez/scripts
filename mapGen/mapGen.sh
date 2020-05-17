#!/bin/sh

# mapGen.sh
#
# Generate a map with ImageMagick from an input text file
#
# Usage: mapGen.sh [-s SIZE] [-f TILE_FOLDER] [-o OUTPUT_FILE] SOURCE_FILE

usageMsg="Usage: mapGen.sh [-s SIZE] [-f TILE_FOLDER] [-o OUTPUT_FILE] SOURCE_FILE"
cellSize=8
tilesDir="./tiles"
outputFile="out.jpg"

while echo "$1" | grep '^-' >/dev/null; do
	case "$1" in
		"-s")
			[ -z "$2" ] && echo "Missing argument for -s. $usageMsg" >&2 && exit 1
			cellSize="$2"
			shift 2
			;;
		"-f")
			[ -z "$2" ] && echo "Missing argument for -f. $usageMsg" >&2 && exit 1
			tilesDir="$2"
			shift 2
			;;
		"-o")
			[ -z "$2" ] && echo "Missing argument for -o. $usageMsg" >&2 && exit 1
			outputFile="$2"
			shift 2
	esac
done

[ -z "$1" ] && echo "$usageMsg" >&2 && exit 1

inputFile="$1"

[ ! -f "$inputFile" ] && echo "File not found: $inputFile" >&2 && exit 1
[ ! -d "$tilesDir" ] && echo "Directory not found: $tilesDir" >&2 && exit 1

height="$(wc -l <"$inputFile")"
width="$(awk '{print length($0)}' "$inputFile" | sort -nr | sed 1q)"

height=$((height*cellSize))
width=$((width*cellSize))

echo $width $height

convert -size "$width"x"$height" xc:cyan "$outputFile"

row=0
col=0

while read line; do
	echo "$line" | (
	while read -n1 char; do
		tileFile="$(find $tilesDir | sed 's|.*/||' | grep "^$char" | shuf | sed 1q)"
		tileFile="${tilesDir}/${tileFile}"
		echo "$tileFile" | wc -l | grep 1 >/dev/null || continue
		convert "$outputFile" "$tileFile" -geometry +"$col"+"$row" -composite "$outputFile" ||
			convert "$outputFile" -fill red -draw "point $col,$row" "$outputFile"
		col=$((col+cellSize))
	done)
	row=$((row+cellSize))
	col=0
done <"$inputFile"
