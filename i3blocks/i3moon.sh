#!/bin/sh

# Shows an emoji with the phase of the moon

[ ! -f "/bin/pom" ] && echo "🌜 bsd-games not installed. 🌛" && exit 0
pom | fgrep -q "New" && moon=🌚
pom | fgrep -q "Waxing Crescent" && moon=🌒
pom | fgrep -q "First Quarter" && moon=🌓
pom | fgrep -q "Waxing Gibbous" && moon=🌔
pom | fgrep -q "is Full" && moon=🌝
pom | fgrep -q "Waning Gibbous" && moon=🌖
pom | fgrep -q "Last Quarter" && moon=🌗
pom | fgrep -q "Waning Crescent" && moon=🌘

echo "$moon"

case $BLOCK_BUTTON in
	1) dunstify -r "$(dunstifyIDs.sh "moon")" "$moon $(pom) $moon";;
esac

