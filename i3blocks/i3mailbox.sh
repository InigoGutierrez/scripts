#!/bin/sh

# i3blocks mail module.
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

syncIcon=""
[ -n "$(pgrep mbsync)" ] && syncIcon="🔃"
gmailN="$(du -a ~/.mail/gmail/INBOX/new/* 2>/dev/null | sed -n '$=')"
[ "$gmailN" ] || gmailN="0"
unioviN="$(du -a ~/.mail/uniovi/INBOX/new/* 2>/dev/null | sed -n '$=')"
[ "$unioviN" ] || unioviN="0"
#echo "$(cat /tmp/imapsyncicon) Gmail: $gmailN  uniovi: $unioviN"
echo "$syncIcon Gmail: $gmailN  uniovi: $unioviN"
