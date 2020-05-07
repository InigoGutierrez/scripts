#!/bin/sh
path="$1"
[ -z "$path" ] && path="/home/taamas/images/wallpapers/"
urxvt -title floating -sh 20 -cr black -geometry "45x6-5-5" -e ~/scripts/bgBrowser.sh "$path"
