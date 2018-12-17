#!/bin/sh

case $BLOCK_BUTTON in
	1) ~/scripts/floatMonths.sh ;;
	3) ~/scripts/floatYears.sh ;;
esac

dayofyear=$(date +%j)
perc=$(echo "scale=1; ($dayofyear*100)/365" | bc)
#echo $(date +"%A, %y/%m/%d ($perc%) - %T")
echo $(date +"%y/%m/%d ($perc%) - %H:%M")
