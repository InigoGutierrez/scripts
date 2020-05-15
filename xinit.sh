#!/bin/sh

# To be run by the window manager or desktop environment when starting an X session
xrdb ~/.Xresources
pgrep -x picom || picom -b
pgrep -x dunst || dunst &
setRandomBG.sh
setxkbmap -layout es -option caps:swapescape
xset -b
pgrep -x unclutter || unclutter --idle 1 &
#touchpad.sh
urxvt -e tmux new -s main &
pgrep -x sxhkd || sxhkd >~/logs/sxhkd.log &
