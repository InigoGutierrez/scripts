#!/bin/sh

lowriter --convert-to pdf --outdir /tmp/pdf "$1" 1>/dev/null 2>&1
zathura /tmp/pdf/"${1%.*}.pdf" &
