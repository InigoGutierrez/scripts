#!/bin/sh

# Shows an emoji with the phase of the moon

[ ! -f "/bin/pom" ] && echo "🌜 bsd-games not installed. 🌛" && exit 0
pom | grep -q "New" && moon=🌚
pom | grep -q "Waxing Crescent" && moon=🌒
pom | grep -q "First Quarter" && moon=🌓
pom | grep -q "Waxing Gibbous" && moon=🌔
pom | grep -q "Full" && moon=🌝
pom | grep -q "Waning Gibbous" && moon=🌖
pom | grep -q "Last Quarter" && moon=🌗
pom | grep -q "Waning Crescent" && moon=🌘

echo "$moon"

case $BLOCK_BUTTON in
	1) dunstify -r "$(dunstifyIDs.sh "moon")" "$moon $(pom) $moon";;
esac

