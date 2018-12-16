#!/bin/bash
#                _ _
# __      ____ _| | |_ __   __ _ _ __   ___ _ __
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
#     _             |_|         |_|
#    | |__  _ __ _____      _____  ___ _ __
#    | '_ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
#    | |_) | | | (_) \ V  V /\__ \  __/ |
#    |_.__/|_|  \___/ \_/\_/ |___/\___|_|
#

#folder="/home/inigo/images/wallpapers/"
folder="$1"
indexSet=0

function updateFiles {
	files=$(ls "$folder" | grep -e .jpg -e .jpeg -e .png)
}

function updateCurrentFile {
	i=0
	for file in $files; do
		i=$(($i+1))
		if [ $i -eq $indexSet ]; then
			selectedFile="$file"
		fi
	done
}

function updateBg {
	feh --bg-scale "$folder""$selectedFile"
	echo "New bg: $selectedFile"
}

echo "Welcome to bg browser! Usage:"
echo "h, l - Browse wallpapers."
echo "r - Rename current wallpaper's file."
echo "d - Delete current wallpaper's file."
echo "q - Quit."

updateFiles
read -n 1 input
while [ "$input" != "q" ]
do
	case $input in
		l)
			indexSet=$(($indexSet+1))
			clear
			updateCurrentFile
			updateBg
			;;
		h)
			indexSet=$(($indexSet-1))
			clear
			updateCurrentFile
			updateBg
			;;
		r)
			clear && echo "Rename? [y]es/[no]"
			read -n 1 input
			if [ "$input" = "y" ]; then
				clear && echo "Prev name: $selectedFile" && echo "New name: "
				read newName
				if [ "$newName" = "$selectedFile" ]; then
					clear && echo "Same name ("$newName") - No changes"
				else
					# Check that name does not exist
					if [ -f "$folder$newName" ]; then #FIX
						clear && echo "\"$newName\" already exists - Aborting"
					else
						mv "$folder$selectedFile" "$folder$newName"
						echo "$selectedFile -> $newName"
						updateFiles
						updateCurrentFile
						updateBg
					fi
				fi
			else
				clear && echo "Current bg: $selectedFile"
			fi
			;;
		d)
			clear && echo "Delete $selectedFile? [y]es/[no]"
			read -n 1 input
			if [ "$input" = "y" ]; then
				rm "$folder$selectedFile"
				clear && echo "\"$selectedFile\" deleted"
				updateFiles
				updateCurrentFile
				updateBg
			else
				clear && echo "Not deleted." && echo "Current bg: $selectedFile"
			fi
			;;
		*)
			clear && echo "Current bg: $selectedFile"
			;;
		esac
			read -n 1 input
done
