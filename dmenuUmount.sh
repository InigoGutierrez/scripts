#!/bin/bash
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

exclusionregex="\(/boot/efi\|/home\|/\)$"
list="$(lsblk -lp | grep "part /" | grep -v "$exclusionregex")"
[ "$list" = "" ] && notify-send -t 2000 "No devices found to unmount." && exit 0
drives=""
i=0
while read -r line
do
	i=$((i+1))
	name="$(echo "$line" | awk '{print $1}')"
	size="$(echo "$line" | awk '{print $4}')"
	mountpoint="$(echo "$line" | awk '{print $7}')"
	label="$(lsblk -lpo "name,label" | grep "$name" | awk '{print $2}')"
	fstype="$(lsblk -lpo "name,fstype" | grep "$name" | awk '{print $2}')"
	drives="$drives$i. $name ($size) \"$label\" [$fstype] on $mountpoint"$'\n'
done <<< "$list"
[ "$drives" = "" ] && exit
lines=$(echo "$drives" | wc -l)
chosen=$(echo "$drives" | dmenu -i -l "$lines" -p "Unmount which drive?" | awk '{print $2}')
[ "$chosen" = "" ] && exit
sudo umount "$chosen" && pgrep -x dunst && notify-send "$chosen unmounted."
