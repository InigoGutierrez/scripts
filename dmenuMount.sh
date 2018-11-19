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

mountable=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
[[ "$mountable" = "" ]] && exit 1
chosen=$(echo "$mountable" | dmenu -i -p "Mount which drive?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1
#sudo -u inigo mount "$chosen" && exit 0
mount "$chosen" && notify-send "$chosen mounted" && exit 0
dirs=$(find /media /home/inigo/mounts -type d -maxdepth 3 -empty 2>/dev/null)
mountpoint=$(echo "$dirs" | dmenu -i -p "Type in mount point.")
[[ "$mountpoint" = "" ]] && exit 1
if [[ ! -d "$mountpoint" ]]; then
	bash /home/inigo/scripts/prompt.sh "$mountpoint does not exist. Create it?" "mkdir -p $mountpoint"
fi
#sudo -u inigo mount $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen mounted to $mountpoint."
mount $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen mounted to $mountpoint."
