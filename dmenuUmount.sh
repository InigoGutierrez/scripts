#!/bin/sh
#          _
#       __| |_ __ ___   ___ _ __  _   _
#      / _` | '_ ` _ \ / _ \ '_ \| | | |
#     | (_| | | | | | |  __/ | | | |_| |
#      \__,_|_| |_| |_|\___|_| |_|\__,_|
#                                    _
#  _   _ _ __ ___   ___  _   _ _ __ | |_ ___
# | | | | '_ ` _ \ / _ \| | | | '_ \| __/ __|
# | |_| | | | | | | (_) | |_| | | | | |_\__ \
#  \__,_|_| |_| |_|\___/ \__,_|_| |_|\__|___/
#
# Gives a dmenu prompt to umount mounted drives.
# Shows mounted partitions; select one to unmount.

exclusionregex="\(/boot\|/home\|/\)$"
drives=""
i=0
while read -r line
do
	i=$((i+1))
	drives="$drives$i. $( echo "$line" | awk '{print $1, "(" $4 ")", "on", $7}' )"$'\n'
done <<< "$(lsblk -lp | grep "part /" | grep -v "$exclusionregex")"
[ "$drives" == "" ] && exit
lines=$(echo "$drives" | wc -l)
chosen=$(echo "$drives" | dmenu -i -l $lines -p "Unmount which drive?" | awk '{print $2}')
[ "$chosen" == "" ] && exit
umount $chosen && pgrep -x dunst && notify-send "$chosen unmounted."
