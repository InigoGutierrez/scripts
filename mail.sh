#!/bin/sh

# Opens a mailbox using neomutt (and isync if neomutt configured to do so)

pkill -SIGRTMIN+15 i3blocks
account="$(printf "gmail\nuniovi" | fzf)"
[ "$account" = "gmail" ] && neomutt -F "$HOME/.config/mutt/gmmuttrc"
[ "$account" = "uniovi" ] && neomutt -F "$HOME/.config/mutt/cumuttrc"
pkill -SIGRTMIN+15 i3blocks
