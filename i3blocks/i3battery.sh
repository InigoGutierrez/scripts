#!/bin/sh
# Give a battery name (e.g. BAT1) as an argument.

case $BLOCK_BUTTON in
    3) pgrep -x dunst >/dev/null && notify-send -t 5000 "<b>🔋 Battery module:</b>
🔋: discharging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Text color reflects charge left" ;;
esac

capacity=$(cat /sys/class/power_supply/"$1"/capacity) || exit
status=$(cat /sys/class/power_supply/"$1"/status)

if [ "$capacity" -ge 80 ]; then
	color="#b8bb26"
elif [ "$capacity" -ge 60 ]; then
	color="#ebdbb2"
elif [ "$capacity" -ge 40 ]; then
	color="#fabd2f"
elif [ "$capacity" -ge 20 ]; then
	color="#fe8019"
else
	color="#fb4934"
	warn="❗"
fi

#[ ! "$capacity" -gt 15 ] && warn="❗"
[ -z $warn ] && warn=""

[ "$status" = "Charging" ] && color="#1fffaf"

#printf "%s%s%s%s" "$(echo "$status" | sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/♻️/;s/Full/⚡/;s/ 0*/ /g;s/ :/ /g")" "$warn" "$(echo "$capacity" | sed -e 's/$/%/')" "$warn"
printf "<span color='%s'>%s%s%s</span>" "$color" "$(echo "$status" | sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/♻️/;s/Full/⚡/;s/ 0*/ /g;s/ :/ /g")" "$warn" "$(echo "$capacity" | sed -e 's/$/%/')"

echo ""
