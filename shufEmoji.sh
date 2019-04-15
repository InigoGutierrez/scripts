#!/bin/sh

# Echoes some random emojis

file="$XDG_CONFIG_HOME/emoji"
count=$1
cut -d' ' -f1 < "$file" | shuf -n "$count" | tr -d '\n'
