#!/bin/sh

# Reads ~/.paths and uses dmenu to echo a path.

[ -z "$1" ] && prompt="Choose a path:" || prompt="$1"
echo "$(cat $HOME/.paths | dmenu -l $(cat $HOME/.paths | wc -l) -p "$prompt" | awk '{print $3}')"

