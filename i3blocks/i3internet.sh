#!/bin/sh

# Shows status of wifi and ethernet connections.

# Depends on nmcli and ip for IPs
case $BLOCK_BUTTON in
	1) i3-msg "exec urxvt -e nmtui" >/dev/null ;;
esac

wifiDev="wlp2s0"
ethDev="enp3s0"
wstatus=$(cat /sys/class/net/$wifiDev/operstate)
estatus=$(cat /sys/class/net/$ethDev/operstate)

if [ "$wstatus" = "down" ]; then
	wifi="❌"
elif [ "$(nmcli | grep "$wifiDev: connecting ")" ]; then
		step="$(nmcli | grep "$wifiDev: connecting " | sed 's/^.*(/(/;s/).*$/)/')"
	wifi="⚙️ <span color='#fabd2f'>$(nmcli | grep "$wifiDev: " | cut -d' ' -f5-) $step</span>"
else
	# with IP
	#wifi="✔️$(nmcli | grep "$wifiDev: connected to " | cut -d' ' -f4-) ($(ip addr show $wifiDev | grep "inet " | cut -d' ' -f6)) ($(grep "^\s*w" /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}'))"
	# with name
	wifi="✔️ $(nmcli | grep "$wifiDev: connected to " | cut -d' ' -f4-) ($(grep "^\s*w" /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}'))"
fi
if [ -z "$(nmcli | grep $ethDev)" ]; then
	en="❌❗ No $ethDev device found"
elif [ "$estatus" = "down" ]; then
	en="❌"
else
	# with IP
	#en=$(ip addr show $ethDev | grep "inet " | cut -d' ' -f6)
	# no IP
	en=✔️
fi

echo "📶$wifi  🌐$en"
