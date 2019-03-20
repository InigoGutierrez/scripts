#!/bin/sh

# Prints a random banner using figlet and lolcat and choosing a line from ~/.config/.banners

nlines=$(cat $HOME/.config/.banners | wc -l)
line=$(($(($RANDOM % $nlines)) + 1))

figlet "Code : $(sed "${line}q;d" $HOME/.config/.banners)" | lolcat
