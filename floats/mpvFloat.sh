#!/bin/sh

nohup mpv --geometry=-0-0 --autofit=40% --title="mpvfloat" "$@" >/dev/null &
