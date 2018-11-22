#!/bin/sh

urxvt -title "floating" -geometry "100x8-0-0" -e youtube-dl -o "~/downloads/audios/%(title)s.%(ext)s" -x --audio-format mp3 "$1" &
