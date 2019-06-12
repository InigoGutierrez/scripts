#!/bin/sh
youtube-dl --add-metadata --all-subs --embed-subs -o "$HOME/downloads/videos/%(title)s.%(ext)s" "$1"
