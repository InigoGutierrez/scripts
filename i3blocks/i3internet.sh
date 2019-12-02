#!/bin/sh

# Shows status of wifi and ethernet connections.

# Depends on nmcli and ip for IPs
case $BLOCK_BUTTON in
	1) i3-msg "exec urxvt -title "floating" -e nmtui" >/dev/null ;;
esac

wifiDev="wlp2s0"
ethDev=""
wstatus="$(cat /sys/class/net/$wifiDev/operstate)"
estatus="$(cat /sys/class/net/$ethDev/operstate)"
tick=✅
wifiSymbol="📶"
ethSymbol="🌐"

if [ "$wstatus" = "down" ]; then
	wifi="❌"
elif [ "$(nmcli | fgrep "$wifiDev: connecting ")" ]; then
	step="$(nmcli | fgrep "$wifiDev: connecting " | sed 's/^.*(/(/;s/).*$/)/')"
	wifi="$tick <span color='#fabd2f'>$(nmcli | fgrep "$wifiDev: " | cut -d' ' -f5-) $step</span>"
else
	# with IP
	#wifi="$tick$(nmcli | fgrep "$wifiDev: connected to " | cut -d' ' -f4-) ($(ip addr show $wifiDev | fgrep "inet " | cut -d' ' -f6)) ($(egrep "^\s*w" /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}'))"
	# with name
	wifi="$tick <span color='#79ff79'>$(nmcli | fgrep "$wifiDev: connected to " | cut -d' ' -f4-) ($(egrep '^\s*w' /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}'))</span>"
fi

[ -z "$ethDev" ] && echo "$wifiSymbol$wifi" && exit 0

if [ -z "$(nmcli | fgrep "$ethDev")" ]; then
	en="❌❗ No $ethDev"
elif [ "$estatus" = "down" ]; then
	en="❌"
else
	# with IP
	#en=$(ip addr show $ethDev | fgrep "inet " | cut -d' ' -f6)
	# no IP
	en=$tick
fi

echo "$wifiSymbol$wifi  $ethSymbol$en"
exit 0
