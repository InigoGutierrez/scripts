#!/bin/sh
youtube-dl --skip-download --write-thumbnail -o "$HOME/downloads/%(title)s.%(ext)s" "$@"
