#!/bin/sh
#
# Sets off nvidia at startup
cp "$HOME/.xinitrci3bckintel" "$HOME/.xinitrci3"
sudo optimus-manager --set-startup intel
