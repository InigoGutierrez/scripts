#!/bin/sh

case $BLOCK_BUTTON in
	1) ~/scripts/floats/floatMonths.sh ;;
	2) notify-send -h string:x-canonical-private-synchronous:date -t 1000 "$(echo "scale=1; ($(date +%j)*100)/365" | bc)%" ;;
	3) ~/scripts/floats/floatYears.sh ;;
esac

#dayofyear=$(date +%j)
#perc=$(echo "scale=1; ($dayofyear*100)/365" | bc)
#echo $(date +"%A, %y/%m/%d ($perc%) - %T")

day="$(date +"%y/%m/%d")"
hour="$(date +"%H:%M")"

min=${hour#*:}
baseHour=${hour/:*}
[ $baseHour -gt 11 ] && baseHour=$((baseHour-12))

clocks=(🕛 🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕧 🕜 🕝 🕞 🕟 🕠 🕡 🕢 🕣 🕤 🕥 🕦)
clockIndex=$baseHour
[ $min -gt 29 ] && clockIndex=$((clockIndex+12))
clock="${clocks[clockIndex]}"

echo $clock $day $hour
echo $clock $hour
