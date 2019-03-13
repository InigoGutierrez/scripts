#!/bin/bash
#       _
#    __| |_ __ ___   ___ _ __  _   _
#   / _` | '_ ` _ \ / _ \ '_ \| | | |
#  | (_| | | | | | |  __/ | | | |_| |
#   \__,_|_| |_| |_|\___|_| |_|\__,_|
#                              _
#  _ __ ___   ___  _   _ _ __ | |_ ___
# | '_ ` _ \ / _ \| | | | '_ \| __/ __|
# | | | | | | (_) | |_| | | | | |_\__ \
# |_| |_| |_|\___/ \__,_|_| |_|\__|___/
#
#
# Gives a dmenu prompt to mount unmounted drives.
# If they're in /etc/fstab, they'll be mounted automatically.
# Otherwise, prompts to give a mountpoint from already existing directories.
# If you input a novel directory, prompts to create that directory.

pgrep -x dmenu && exit

# Select partition to mount
mountable=""
i=0
while read -r line
do
	i=$((i+1))
	name="$(echo "$line" | awk '{print $1}')"
	size="$(echo "$line" | awk '{print $4}')"
	label="$(lsblk -lpo "name,label" | grep "$name" | awk '{print $2}')"
	fstype="$(lsblk -lpo "name,fstype" | grep "$name" | awk '{print $2}')"
	mountable="$mountable$i. $name ($size) \"$label\" [$fstype]"$'\n'
	#$( echo "$line" | awk '{print $, "(" $2 ")", "\"" $3 "\"", "[" $4 "]"}' )"$'\n'
done <<< "$(lsblk -lp | grep "part $" )"
[[ "$mountable" = "" ]] && exit 1
lines=$(echo "$mountable" | wc -l)
chosen=$(echo "$mountable" | dmenu -i -l $lines -p "Mount which drive?" | awk '{print $2}')
[ "$chosen" == "" ] && exit 1
sudo mount "$chosen" && pgrep -x dunst && notify-send "$chosen mounted." && exit 0

# Select mount point (reached if previous mount failed, e.g. device not in /etc/fstab)
directories=""
i=0
while read -r line
do
	i=$((i+1))
	directories="$directories$i. $line"$'\n'
done <<< "$(find /mnt $HOME/mounts -type d -maxdepth 3 -empty 2>/dev/null)"
lines=$(echo "$directories" | wc -l)
mountpoint=$(echo "$directories" | dmenu -i -l $lines -p "Type in mount point." | awk '{print $2}')
[ "$mountpoint" == "" ] && exit 1
if [[ ! -d "$mountpoint" ]]; then
	prompt.sh "$mountpoint does not exist. Create it?" "sudo mkdir -p $mountpoint"
fi
sudo mount $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen mounted to $mountpoint."
