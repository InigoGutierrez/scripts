#!/bin/sh
dayofyear=$(date +%j)
perc=$(echo "scale=1; ($dayofyear*100)/365" | bc)
echo $(date +"%A, %y/%m/%d ($perc%) - %T")
