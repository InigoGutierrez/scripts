#!/bin/bash
# A dmenu prompt script to control system functions.

options="lock\nreboot\nshutdown\nexit i3" 

chosen=$(echo -e "$options" | dmenu)

case "$chosen" in
	lock) i3lock -i ~/images/wallpapers/lockbg.png -f ;;
	reboot) bash ~/scripts/prompt.sh Reboot? reboot ;;
	shutdown) bash ~/scripts/prompt.sh Shutdown? "shutdown now" ;;
	"exit i3") bash ~/scripts/prompt.sh "Exit i3? (ends X session)" "i3-msg exit" ;;
esac
