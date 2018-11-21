#!/bin/bash
# dmenu script for opening console programs and scripts directly

options="neofetch\ncmus\nnewsboat\nneomutt\nsyncthing\nbrightFirst\nresetConnection\nwifiDown\nyears\nmonths\nbg selection\nshowColors" 

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
	# floating windows
	neofetch) urxvt -name floating -sh 30 -cr black -geometry 80x21 -e bash ~/scripts/neofetch.sh ;;
	showColors) urxvt -name floating -sh 10 -cr black -geometry 43x9 -e bash ~/scripts/showColors.sh ;;
	years) urxvt -name floating -sh 20 -cr black -geometry 66x39 -e bash ~/scripts/years.sh ;;
	months) urxvt -name floating -sh 20 -cr black -geometry 22x9 -e bash ~/scripts/months.sh ;;
	"bg selection") urxvt -name floating -sh 20 -cr black -geometry 45x6 -e bash ~/scripts/bgBrowser.sh ;;
	#programs
	cmus) urxvt -cd ~/music -e cmus ;;
	newsboat) urxvt -e newsboat ;;
	neomutt) urxvt -e neomutt ;;
	syncthing) qutebrowser && urxvt -e bash ~/scripts/syncthing.sh ;;
	# sudo stuff
	brightFirst) urxvt -name floating  -geometry 32x1 -e sudo bash ~/scripts/brightFirst.sh ;;
	resetConnection) urxvt -name floating  -geometry 32x1 -e sudo bash ~/scripts/resetConnection.sh ;;
	wifiDown) urxvt -name floating  -geometry 32x1 -e sudo bash ~/scripts/wifiDown.sh ;;
esac
