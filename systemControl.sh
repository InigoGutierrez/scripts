#!/bin/bash
# A dmenu prompt script to control system functions.

options="lock\nreboot\nshutdown\nsuspend\nhibernate\nexit i3"

chosen=$(echo -e "$options" | dmenu -p ">_")

case "$chosen" in
	"lock") i3lock.sh ;;
	"reboot") ~/scripts/prompt.sh Reboot? "systemctl reboot" ;;
	"shutdown") ~/scripts/prompt.sh Shutdown? "systemctl poweroff" ;;
	"suspend") systemctl suspend ;;
	"hibernate") ~/scripts/prompt.sh Hibernate? "systemctl hibernate" ;;
	"exit i3") ~/scripts/prompt.sh "Exit i3? (ends X session)" "i3-msg exit" ;;
esac
