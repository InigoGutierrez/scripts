#!/bin/sh
nohup mpv --loop-playlist --geometry=-0-0 --autofit=40% --title="mpvfloat" "$@" >/dev/null &
