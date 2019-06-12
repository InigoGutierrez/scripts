#!/bin/sh
youtube-dl -x --audio-format mp3 --embed-thumbnail -o "$HOME/downloads/audios/%(title)s.%(ext)s" "$1"
