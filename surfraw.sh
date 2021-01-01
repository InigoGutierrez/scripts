#!/bin/sh

# Do stuff using surfraw. Take back internet browsing from evil.

search=$(echo "" | dmenu -p "Search:")
[ -n "$search" ] || exit 0
dunstify "Searching $search"
target="$(ddgr --json "$search" |
	grep -E '"title": |"url": ' |
	sed '/"title": / N;s/\n//g' |
	awk '-F ["]' '{print $3 "[" $5 "]" }' |
	sed 's/"//g;s/,\s*\[/  \[/' |
	dmenu -i -l 10 -p "Target:" |
	awk '-F [[]' '{print $2}' |
	sed 's/]\s*$//')"
dunstify "Trying to play result of $target"
dunstify "Url: $target"
mpv "$target" || qutebrowser "$target" || dunstify "URL not valid."
