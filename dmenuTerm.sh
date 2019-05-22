#!/bin/sh
# dmenu script for opening console programs and scripts directly

options="neofetch\ncmus\ncmus (float)\nnewsboat\nneomutt\nweather\nbrightFirst\nReset NetworkManager\nwifiUp\nwifiDown\nyears\nmonths\nbg selection\nshowColors\npython\nmusicMode\nClose music mode\nemojis"

chosen=$(echo "$options" | dmenu -i -p "~$ urxvt -e")

case "$chosen" in
	# floating windows
	neofetch) urxvt -title invisible -sh 100 -cr "#aaddff" -geometry "80x21+50+35" -e ~/scripts/neofetch.sh ;;
	showColors) urxvt -title floating -sh 10 -cr black -geometry 44x9 -e ~/scripts/showColors.sh ;;
	years) ~/scripts/floats/floatYears.sh ;;
	months) ~/scripts/floats/floatMonths.sh ;;
	weather) urxvt -title floating -sh 10 -geometry 125x40 -e weather.sh ;;
	"bg selection") ~/scripts/floats/floatBgBrowser.sh "$HOME/images/wallpapers/" ;;
	python) urxvt -title floating -geometry 80x28 -e python ;;
	#programs
	cmus) urxvt -cd ~/music -e cmus ;;
	"cmus (float)") urxvt -title floating -sh 20 -geometry "150x12+5-8" -cd ~/music -e cmus ;;
	newsboat) urxvt -e newsboat ;;
	neomutt) urxvt -e neomutt ;;
	# sudo stuff
	brightFirst) sudo ~/scripts/brightFirst.sh ;;
	"Restart NetworkManager") sudo systemctl restart NetworkManager ;;
	wifiUp) wifiUp.sh ;;
	wifiDown) wifiDown.sh ;;
	# other
	musicMode) ~/scripts/musicMode.sh ;;
	"Close music mode") ~/scripts/closeMusicMode.sh  ;;
	emojis) ~/scripts/dmenuUnicode.sh ;;
esac
