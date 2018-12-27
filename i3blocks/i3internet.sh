#!/bin/sh

case $BLOCK_BUTTON in
	1) i3-msg "exec urxvt -e nmtui" >/dev/null ;;
esac

wstatus=$(cat /sys/class/net/wlp2s0/operstate)
estatus=$(cat /sys/class/net/enp3s0/operstate)

if [ $wstatus = "down" ]; then
	wifi="❌"
else
	# with IP
	#wifi="$(nmcli | grep "wlp2s0: conectado to " | cut -d' ' -f4-) ($(ip addr show wlp2s0 | grep "inet " | cut -d' ' -f6)) ($(grep "^\s*w" /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}'))"
	# no IP
	wifi="$(nmcli | grep "wlp2s0: conectado to " | cut -d' ' -f4-) ($(grep "^\s*w" /proc/net/wireless | awk '{print int($3 * 100 / 70)"%"}'))"
fi
if [ $estatus = "down" ]; then
	en="❌"
else
	en=$(ip addr show enp3s0 | grep "inet " | cut -d' ' -f6)
fi

echo "📶$wifi 🌐$en"
