#!/bin/sh

# i3mailbox.sh (i3blocks mail module)
#
# Usage: i3mailbox.sh
#
# Displays number of unread mail and an loading icon if updating.
# When clicked, brings up `neomutt`.

case $BLOCK_BUTTON in
	1) "$TERMINAL" -e mail.sh ;;
	2) setsid "$HOME/scripts/floats/urxvtFloat.sh" 66 3 syncMail.sh >/dev/null & ;;
	3) pgrep -x dunst >/dev/null && dunstify "📬 Mail module" "\- Shows unread mail
- Shows 🔃 if syncing mail
- Left click opens neomutt
- Middle click syncs mail" ;;
esac

label=📫
gmailInbox="$CONFIG_FOLDER_GMAIL_INBOX"
unioviInbox="$CONFIG_FOLDER_UNIOVI_INBOX"
output="$label"
shortOutput="$label"
syncIcon=""
[ -n "$(pgrep mbsync)" ] && syncIcon="🔃"
output="$output$syncIcon"
shortOutput="$shortOutput$syncIcon"

if [ -n "$gmailInbox" ]; then
	gmailN="$(ls "$gmailInbox"/* 2>/dev/null | wc -l)"
	output="$output Gmail: $gmailN "
	shortOutput="$shortOutput G: $gmailN "
fi
if [ -n "$unioviInbox" ]; then
	unioviN="$(ls "$unioviInbox"/* 2>/dev/null | wc -l)"
	output="$output Uniovi: $unioviN "
	shortOutput="$shortOutput U: $unioviN "
fi

#echo "$(cat /tmp/imapsyncicon) Gmail: $gmailN  uniovi: $unioviN"
echo "${output% }"
echo "${shortOutput% }"
