#!/bin/bash
# dmenu script for opening console programs and scripts directly

options="neofetch\ncmus\nnewsboat\nneomutt\nsyncthing\nbrightFirst\nresetConnection\nwifiDown\nyears\nmonths\nbg selection\nshowColors\npython" 

chosen=$(echo -e "$options" | dmenu -i)

case "$chosen" in
	# floating windows
	neofetch) urxvt -title invisible -sh 100 -cr "#aaddff" -geometry "80x21+50+35" -e bash ~/scripts/neofetch.sh ;;
	showColors) urxvt -title floating -sh 10 -cr black -geometry 43x9 -e bash ~/scripts/showColors.sh ;;
	years) urxvt -title floating -sh 20 -cr black -geometry 66x39 -e bash ~/scripts/years.sh ;;
	months) urxvt -title floating -sh 20 -cr black -geometry 22x9 -e bash ~/scripts/months.sh ;;
	"bg selection") urxvt -title floating -sh 20 -cr black -geometry 45x6 -e bash ~/scripts/bgBrowser.sh ;;
	python) urxvt -title floating -geometry 80x28 -e python ;;
	#programs
	cmus) urxvt -cd ~/music -e cmus ;;
	newsboat) urxvt -e newsboat ;;
	neomutt) urxvt -e neomutt ;;
	syncthing) qutebrowser && urxvt -e bash ~/scripts/syncthing.sh ;;
	# sudo stuff
	brightFirst) urxvt -title floating  -geometry 32x1 -e sudo bash ~/scripts/brightFirst.sh ;;
	resetConnection) urxvt -title floating  -geometry 32x1 -e sudo bash ~/scripts/resetConnection.sh ;;
	wifiDown) urxvt -title floating  -geometry 32x1 -e sudo bash ~/scripts/wifiDown.sh ;;
esac
