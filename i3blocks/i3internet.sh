#!/bin/sh

case $BLOCK_BUTTON in
	1) i3-msg "exec urxvt -e nmtui" >/dev/null ;;
	3) pgrep -x dunst >/dev/null && notify-send "<b>🌐 Internet module:</b>
- Click for 'nmtui' for wifi access
📡: no wifi connection
📶: wifi connection with quality
❎: no ethernet
🌐: ethernet working
" ;;
esac
#
#[ "$(cat /sys/class/net/w*/operstate)" = 'down' ] && wifiicon="📡"
#
#[ ! -n "${wifiicon+var}" ] && wifiicon=$(grep "^\s*w" /proc/net/wireless | awk '{ print "📶", int($3 * 100 / 70) "%" }')
#
#printf "%s %s" "$wifiicon" "$(cat /sys/class/net/e*/operstate | sed "s/down/❎/;s/up/🌐/")"

wstatus=$(cat /sys/class/net/wlp2s0/operstate)
estatus=$(cat /sys/class/net/enp3s0/operstate)
wifi="$(nmcli | grep "wlp2s0: conectado to " | cut -d' ' -f4-) ($(ip addr show wlp2s0 | grep "inet " | cut -d' ' -f6))"
en=$(ip addr show enp3s0 | grep "inet " | cut -d' ' -f6)
[ $wstatus = "down" ] && wifi="down"
[ $estatus = "down" ] && en="down"
echo "📶 $wifi | 🌐 $en"
