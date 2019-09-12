#!/bin/sh

# To be run by the window manager or desktop environment when starting an X session
dunst &
xrdb ~/.Xresources
setxkbmap -layout es -option caps:swapescape
xset -b
unclutter --idle 1 &
touchpad.sh
feh --bg-max ~/images/wallpapers/bg_*
urxvt -e tmux new -s main &
