#!/bin/sh
#
# dndCard.sh
#
# Usage: dndCard.sh [-t templateFile] [-b bodyFile] inputFile
#
# Takes some fields from an input file and builds a pdf or image of a card from them.
#
# templateFile indicates the latex template to use. Defaults to template.tex and
# should be provided if such file is not in the working directory
#
# bodyFile indicates a file where the body text is stored, for convenience,
# since this field is usually the longer and should be on one line.
#
# Example input file:
# name#Name of item
# typetext#Type of item
# hint#Hint about the type: a short hint about its effect
# body#Extended description of the item
# flavor#Some free form text for flavor
# icon#Icon file, will default to icon.png
# bgimg#Background file of the image, will default to bg.png
# template#LaTeX template file to use. Will default to template.tex
#
# Dependencies
# A LaTeX distribution which provides the xelatex executable, such as Tex Live
#
# Optional depencencies
# ImageMagick: Uses convert to decorate corners of icon and generate image
# Poppler: Uses pdftoppm to convert pdf to image if ImageMagick is available

if ! type xelatex >/dev/null; then
	echo "There is no xelatex executable in your path. Install a LaTeX
	distribution, such as Tex Live, to use this script."
	exit 1
fi

hasImageMagick="$(type convert)"
hasPdftoppm="$(type pdftoppm)"

body=""
templateFile=""

while echo "$1" | grep '^-'; do
	case "$1" in

		"-b")
			body="$(cat "$2")"
			shift 2
			;;

		"-t")
			templateFile="$2"
			shift 2
			;;

	esac
done

[ -z "$1" ] && echo "Usage: dndCard.sh [-t template] [-b bodyFile] inputFile" && exit 1

input="$1"

name="$(grep '^name' "$input" | awk -F# '{print $2}' )"
typetext="$(grep '^typetext' "$input" | awk -F# '{print $2}')"
hint="$(grep '^hint' "$input" | awk -F# '{print $2}')"
flavor="$(grep '^flavor' "$input" | awk -F# '{print $2}')"
icon="$(grep '^icon' "$input" | awk -F# '{print $2}')"
bgimg="$(grep '^bgimg' "$input" | awk -F# '{print $2}')"
[ -z "$body" ] && body="$(grep '^body' "$input" | awk -F# '{print $2}')"
[ -z "$templateFile" ] && templateFile="$(grep '^template' "$input" | awk -F# '{print $2}')"

[ -z "$templateFile" ] && templateFile="template.tex"
[ -z "$icon" ] && icon="icon.png"
[ -z "$bgimg" ] && bgimg="bg.png"

if [ -n "$hasImageMagick" ]; then
	iconTarget="/tmp/dndCardIcon.png"
	convert "$icon" \( +clone -alpha extract -draw 'fill black polygon 0,0 0,35 35,0 fill white circle 15,15 15,0' \( +clone -flip \) -compose Multiply -composite \( +clone -flop \) -compose Multiply -composite \) -alpha off -compose CopyOpacity -composite "$iconTarget"
	icon="$iconTarget"
fi

sourceText="$(sed -e "s|@name@|${name}|"\
	-e "s|@type@|${typetext}|"\
	-e "s|@hint@|${hint}|"\
	-e "s|@body@|${body}|"\
	-e "s|@flavor@|${flavor}|"\
	-e "s|@icon@|${icon}|"\
	-e "s|@bgimg@|${bgimg}|"\
	"$templateFile")"

if [ ! -f "$bgimg" ]; then
	sourceText=$(echo "$sourceText" | sed -e 's/^%//' -e '/%bg%/d')
fi

echo "$sourceText" | xelatex >xelatex.log

fileName="$(echo "$name" | sed 's| |_|g')"

[ -f texput.aux ] && rm texput.aux
[ -f texput.log ] && rm texput.log
mv texput.pdf "${fileName}.pdf"

if [ -n "$hasImageMagick" ] && [ -n "$hasPdftoppm" ] && [ -f "${fileName}.pdf" ]; then
	pdftoppm "${fileName}.pdf" output
	convert output-1.ppm "${fileName}.png"
	rm output-*.ppm
fi
