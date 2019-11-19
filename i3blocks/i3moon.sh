#!/bin/sh

# Shows an emoji with the phase of the moon

[ ! -f "/bin/pom" ] && echo "🌜 bsd-games not installed. 🌛" && exit 0
pom | grep -F -q "New" && moon=🌚
pom | grep -F -q "Waxing Crescent" && moon=🌒
pom | grep -F -q "First Quarter" && moon=🌓
pom | grep -F -q "Waxing Gibbous" && moon=🌔
pom | grep -F -q "is Full" && moon=🌝
pom | grep -F -q "Waning Gibbous" && moon=🌖
pom | grep -F -q "Last Quarter" && moon=🌗
pom | grep -F -q "Waning Crescent" && moon=🌘

echo "$moon"

case $BLOCK_BUTTON in
	1) dunstify -r "$(dunstifyIDs.sh "moon")" "$moon $(pom) $moon";;
	3) dunstify -r "$(dunstifyIDs.sh "moon")" "moon" "$(curl 'wttr.in/moon?0T')";;
esac

