#!/bin/sh

# mapGen.sh
#
# Generate a map with ImageMagick from an input text file

inputFile="$1"

cellSize=8

tilesDir="./tiles"

height="$(wc -l <"$inputFile")"
width="$(awk '{print length($0)}' "$inputFile" | sort -nr | sed 1q)"

height=$((height*cellSize))
width=$((width*cellSize))

echo $width $height

convert -size "$width"x"$height" xc:cyan out.jpg

row=0
col=0

while read line; do
	echo "$line" | (
	while read -n1 char; do
		tileFile="$(find $tilesDir | sed 's|.*/||' | grep "^$char")"
		tileFile="${tilesDir}/${tileFile}"
		echo "$tileFile" | wc -l | grep 1 >/dev/null || continue
		convert out.jpg "$tileFile" -geometry +"$col"+"$row" -composite out.jpg ||
			convert out.jpg -fill red -draw "point $col,$row" out.jpg
		col=$((col+cellSize))
	done)
	row=$((row+cellSize))
	col=0
done <"$inputFile"
