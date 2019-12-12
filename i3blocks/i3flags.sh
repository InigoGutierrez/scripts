#!/bin/bash

# i3Flags.sh
#
# Usage: i3Flags.sh [COMMAND]...
#
# Outputs a line for each of a list of programs, showing if it is executing.
# pgrep -x is used for the name matching, so command names must be exact.
# Uses a default list of programs if none is provided.

#case $BLOCK_BUTTON in
#	1) # Left click
#	2) # Middle click
#	3) # Right click
#esac

if [ -z "$1" ]; then
	programs="cmus picom dunst"
else
	programs="$*"
fi
flags=""

for program in $programs; do
	if [ -n "$(pgrep -x "$program")" ]; then
		flag="$(echo "${program:0:1}" | awk '{print toupper($1)}')"
		flags="${flags}${flag}"
	else
		flag="$(echo "${program:0:1}" | awk '{print tolower($1)}')"
		flags="${flags}${flag}"
	fi
done

echo "$flags"
