#!/bin/sh
urxvt -title "floating" -geometry "100x8-0-0" -e youtube-dl --add-metadata --all-subs --embed-subs -o "$HOME/downloads/videos/%(title)s.%(ext)s" "$1"
