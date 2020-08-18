#!/bin/sh
nohup mpv --geometry=-10-10 --autofit=40% --title="mpvfloat" "$@" >/dev/null &
