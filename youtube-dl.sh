#!/bin/sh
youtube-dl --add-metadata \
	--write-auto-sub --all-subs --embed-subs --sub-format "srt/best" \
	-o "$HOME/downloads/videos/%(title)s.%(ext)s" "$@"
