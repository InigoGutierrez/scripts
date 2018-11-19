#!/bin/bash
#                        _   _         
#  _ __ ___   ___  _ __ | |_| |__  ___ 
# | '_ ` _ \ / _ \| '_ \| __| '_ \/ __|
# | | | | | | (_) | | | | |_| | | \__ \
# |_| |_| |_|\___/|_| |_|\__|_| |_|___/
# 
# Navigates through month calendars and exits with q

month=$(date +%m)
year=$(date +%Y)
ncal -b -m $month $year
read -n 1 input

while [ "$input" != "q" ]
do
	case $input in
		l)
			clear
			month=$(($month%12+1))
			if [ $month -eq 1 ]
			then
				year=$(($year+1))
			fi
			ncal -b -m $month $year
			read -n 1 input
			;;
		h)
			clear
			month=$(($(($month-1))%12))
			if [ $month -eq 0 ]
			then
				month=12
				year=$(($year-1))
			fi
			ncal -b -m $month $year
			read -n 1 input
			;;
	esac
done
                                     
