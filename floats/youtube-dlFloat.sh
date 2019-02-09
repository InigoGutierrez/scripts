#!/bin/sh

urxvt -title "floating" -geometry "100x8-0-0" -e youtube-dl --all-subs --embed-subs -o "~/downloads/videos/%(title)s.%(ext)s" "$1" &
