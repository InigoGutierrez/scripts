#!/bin/sh

# Obtain an id from ~/.config/dunst/dunstifyIDs by grepping a word. For using with dunstify for replaceable notifications.

cat $HOME/.config/dunst/dunstifyIDs | grep $1 | awk '{print $2}'
