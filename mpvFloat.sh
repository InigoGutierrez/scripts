#!/bin/sh

nohup mpv --geometry=-0-0 --autofit=40% --title="mpvfloat" "$1" >/dev/null &
