#!/bin/sh
# Usage: dateReverser.sh [-s SEPARATOR] [-i[BACKUP_SUFFIX]] [FILE]...
#
# Reverses the order of dates found in files (dates have the format n-n-n)
# and prints the result to standard output.
#
# With -i makes changes directly in the files instead and creates a backup if
# BACKUP_SUFFIX is specified.
# Reads from stdin if no arguments specified.

helpMessage="usage: dateReverser.sh [-s SEPARATOR] [-i[BACKUP_SUFFIX]] [FILE]...

    -s SEPARATOR
        Uses SEPARATOR instead of \"-\" as date field separator

    -i[BACKUP_SUFFIX]
        Actually edit files instead of print to standard output
        Make backup files if BACKUP_SUFFIX is specified"
sep="-"
inFile=""

while echo "$1" | grep -q '^-'; do
	case "$1" in
		"-s" )
		sep="$2"
		if echo "$sep" | grep -q '/'; then
			sep="$(echo "$2" | sed 's|/|\\/|g')"
		fi
			shift 2 ;;
		"-i"* )
			inFile="$1"
			shift ;;
		* )
			echo "$helpMessage"
			exit 1;;
	esac
done

for file in "$@"; do
	if [ -n "$file" ] && [ ! -f "$file" ]; then
		echo "Error: file $file not found"
		exit 1
	fi
done

sedscr='s/\([0-9][0-9]*\)'"$sep"'\([0-9][0-9]*\)'"$sep"'\([0-9][0-9]*\)/\3'"$sep"'\2'"$sep"'\1/g'

sed $inFile $sedscr "$@"
