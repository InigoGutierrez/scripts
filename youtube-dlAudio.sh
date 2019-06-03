#!/bin/sh
youtube-dl -o "$HOME/downloads/audios/%(title)s.%(ext)s" -x --audio-format mp3 --embed-thumbnail "$1"
