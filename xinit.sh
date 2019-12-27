#!/bin/sh

# To be run by the window manager or desktop environment when starting an X session
xrdb ~/.Xresources
picom -b
dunst &
setRandomBG.sh
setxkbmap -layout es -option caps:swapescape
xset -b
unclutter --idle 1 &
#feh --bg-max ~/images/wallpapers/bg_*
#touchpad.sh
urxvt -e tmux new -s main &
#optimus-manager-qt &
