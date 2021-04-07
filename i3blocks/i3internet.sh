#!/bin/sh

# Shows status of wifi and ethernet connections.

# Depends on nmcli and ip for IPs
case $BLOCK_BUTTON in
	1) i3-msg "exec urxvt -title \"floating\" -e nmtui" >/dev/null ;;
esac

wifiDev="$CONFIG_WIFI_DEV"
ethDev="$CONFIG_ETH_DEV"
tick="✅"
wifiSymbol=""
wifi=""
ethSymbol=""
eth=""

if [ -n "$wifiDev" ]; then
	wifiSymbol="📶"
	wstatus="$(cat "/sys/class/net/$wifiDev/operstate")"
	if [ "$wstatus" = "down" ]; then
		wifi="❌"
	elif nmcli | grep -F -q "$wifiDev: connecting "; then
		step="$(nmcli | grep -F "$wifiDev: connecting " | sed 's/^.*(/(/;s/).*$/)/')"
		wifi="$tick <span color='#fabd2f'>$(nmcli | grep -F "$wifiDev: " |
			cut -d' ' -f5-) $step</span>"
	else
		# with IP
		#wifi="$tick$(nmcli | fgrep "$wifiDev: connected to " |
		#cut -d' ' -f4-) ($(ip addr show $wifiDev | fgrep "inet " |
		#cut -d' ' -f6)) ($(egrep "^\s*w" /proc/net/wireless |
		#awk '{print int($3 * 100 / 70)"%"}'))"
		# with name
		quality="$(grep -E '^\s*w' /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}')"
		echo "$quality" | grep -q '100' && quality='100'
		wifi="$tick <span color='#79ff79'>$(nmcli |
			grep -F "$wifiDev: connected to " |
			cut -d' ' -f4-) (${quality})</span>"
	fi
fi

if [ -n "$ethDev" ]; then
	ethSymbol="🌐"
	estatus="$(cat "/sys/class/net/$ethDev/operstate")"
	if ! nmcli | grep -F -q "$ethDev"; then
		eth="❌❗ No $ethDev"
	elif [ "$estatus" = "down" ]; then
		eth="❌"
	else
		# with IP
		#eth=$(ip addr show $ethDev | fgrep "inet " | cut -d' ' -f6)
		# no IP
		eth=$tick
	fi
fi

echo "$wifiSymbol$wifi  $ethSymbol$eth" | sed 's/^ *//' | sed 's/ *$//'
exit 0
