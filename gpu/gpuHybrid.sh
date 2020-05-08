#!/bin/sh
#
# Sets on nvidia at startup
cp "$HOME/.xinitrci3bcknvidia" "$HOME/.xinitrci3"
sudo optimus-manager --set-startup hybrid

