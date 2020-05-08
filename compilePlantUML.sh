#!/bin/sh
#
# compilePlantUML.sh
#
# Usage: compilePlantUML.sh [-o] INPUTFILE
#
# Compiles a PlantUML file to a temporal png, updating the temporal file if
# it already exists.
# Opens the file with $VIEWER if -o option is given.

open=""
if [ "$1" = "-o" ]; then
	open="1"
	shift
fi

[ -z "$1" ] && exit 1

targetDir="/tmp/plantUML"
sourceFile="$1"
targetFile="${targetDir}/${sourceFile##*/}"
targetFile="${targetFile%.*}.png"
#plantUMLExec="$HOME/programs/plantUML/plantuml.jar"

[ -d "$targetDir" ] || mkdir -p "$targetDir"
# java -jar "$plantUMLExec" "$sourceFile" -o "$targetDir"
plantuml "$sourceFile" -o "$targetDir"
[ -n "$open" ] && "$VIEWER" "$targetFile" &
exit 0 # So return value is not that of previous line

