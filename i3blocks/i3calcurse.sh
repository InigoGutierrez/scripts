#!/bin/sh

# i3calcurse.sh
#
# Shows number of appointments today and tomorrow

days="2" # Days to take into account starting from and counting today

case $BLOCK_BUTTON in
	1) dunstify -r "$(dunstifyIDs.sh "calcurse")" "Calendar" "$(calcurse -d"$days" |
		sed 's/^[[:blank:]]*//g')";;
esac

calcurse -d"$days" --format-apt " * %m\n" | grep -c '^ \*'
