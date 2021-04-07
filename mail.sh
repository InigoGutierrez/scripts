#!/bin/sh

# Opens a mailbox using neomutt (and isync if neomutt configured to do so)

pkill -SIGRTMIN+15 i3blocks
account="$(printf "gmail\nuniovi\ndisroot" | fzf)"
[ "$account" = "gmail" ] && neomutt -F "$HOME/.config/mutt/gmmuttrc"
[ "$account" = "uniovi" ] && neomutt -F "$HOME/.config/mutt/cumuttrc"
[ "$account" = "disroot" ] && neomutt -F "$HOME/.config/mutt/drmuttrc"
pkill -SIGRTMIN+15 i3blocks
