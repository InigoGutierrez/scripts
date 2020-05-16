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
extension="${sourceFile##*.}"
texengine="xelatex"
pandocLuaScriptsFolder="$XDG_CONFIG_HOME/pandoc/luascripts"
pandocPlantUmlLuaScript="diagram-generator.lua"

[ -d "$targetDir" ] || mkdir -p "$targetDir"

case "$extension" in
	"tex")
		"$texengine" -output-directory "$targetDir" "$sourceFile"
		;;
	*)
		plantUmlCode=""
		plantUmlScriptPath="${pandocLuaScriptsFolder}/${pandocPlantUmlLuaScript}"
		[ -f "$plantUmlScriptPath" ] && [ -n "$PLANTUML" ] &&
			grep '```{\.plantuml' "$sourceFile" >/dev/null
				plantUmlCode="--lua-filter $plantUmlScriptPath"
		pandoc --pdf-engine=xelatex "$sourceFile" $plantUmlCode -o "$targetFile" > ~/logs/toPDF.log
		;;
esac

[ -n "$open" ] && "$READER" "$targetFile" &
