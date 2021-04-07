#!/bin/sh

# Calls mbsync (isync binary) to syncronize mailboxes

[ -n "$STATUS_BAR" ] && pkill -SIGRTMIN+15 "$STATUS_BAR"
mbsync -c ~/.config/isync/gmmbsyncrc -a
mbsync -c ~/.config/isync/uombsyncrc -a
mbsync -c ~/.config/isync/drmbsyncrc -a
[ -n "$STATUS_BAR" ] && pkill -SIGRTMIN+15 "$STATUS_BAR"
