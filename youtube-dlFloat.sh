#!/bin/sh

urxvt -title "floating" -geometry "100x8-0-0" -e youtube-dl -o "~/downloads/videos/%(title)s.%(ext)s" "$1" &
