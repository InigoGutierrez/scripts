#!/bin/sh

case $BLOCK_BUTTON in
	1) dunstify -r "$(dunstifyIDs.sh "cpu")" -t 5000 "Highest CPU processes:
$(ps axch -o cmd:18,%cpu --sort=-%cpu | sed 10q)" ;;
esac

temp="$(sensors |
awk '/'"$CONFIG_SENSORS_TEMP_REGEX"'/ {print $'"$CONFIG_SENSORS_TEMP_COL"'}' |
sed 's/+//; s/\..*//')"
warn=""

if [ "$temp" -lt 25 ]; then
	color="#696eff"
elif [ "$temp" -lt 45 ]; then
	color="#1fffaf"
elif [ "$temp" -lt 65 ]; then
	color="#b8bb26"
else
	color="#d1375d"
	warn=❗
fi

printf "<span color='%s'>%s%s</span>" "$color" "$temp" "$warn"
echo ""
