#!/bin/sh

case $BLOCK_BUTTON in
	1) ~/scripts/floats/floatMonths.sh ;;
	2) notify-send -h string:x-canonical-private-synchronous:date -t 1000 "$(echo "scale=1; ($(date +%j)*100)/365" | bc)%" ;;
	3) ~/scripts/floats/floatYears.sh ;;
esac

#dayofyear=$(date +%j)
#perc=$(echo "scale=1; ($dayofyear*100)/365" | bc)
#echo $(date +"%A, %y/%m/%d ($perc%) - %T")
echo $(date +"%y/%m/%d %H:%M")
