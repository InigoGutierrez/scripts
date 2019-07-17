#!/bin/sh

# Reads a paths file and uses fzf to echo a path.
# An argument is optional and is used as prompt. A default prompt is used if not provided.

paths="$HOME/.paths"
[ -z "$1" ] && prompt="Choose a path: " || prompt="$1"
fzf --prompt "$prompt" <"$paths" | awk '{print $3}'

