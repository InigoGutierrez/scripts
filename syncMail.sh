#!/bin/sh

# Calls mbsync (isync binary) to syncronize mailboxes

pkill -SIGRTMIN+15 i3blocks
mbsync -c ~/.config/isync/gmmbsyncrc -a
mbsync -c ~/.config/isync/uombsyncrc -a
pkill -SIGRTMIN+15 i3blocks
