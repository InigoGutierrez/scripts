#!/bin/bash
#  _   _  ___  __ _ _ __ ___ 
# | | | |/ _ \/ _` | '__/ __|
# | |_| |  __/ (_| | |  \__ \
#  \__, |\___|\__,_|_|  |___/
#  |___/                     
#
# Navigates through year calendars and exits with q

year=$(date +%Y)
ncal -b -y
read -n 1 input

while [ "$input" != "q" ]
do
	case $input in
		l)
			year=$(($year+1))
			;;
		h)
			year=$(($year-1))
			;;
	esac
		clear
		ncal -b -y $year
		read -n 1 input
done
                           
