#!/bin/sh

# Calls mbsync (isync binary) to syncronize mailboxes

echo "🔃" > /tmp/imapsyncicon
pkill -SIGRTMIN+15 i3blocks
mbsync -c ~/.config/isync/gmmbsyncrc -a
mbsync -c ~/.config/isync/uombsyncrc -a
rm /tmp/imapsyncicon
pkill -SIGRTMIN+15 i3blocks
