#!/bin/sh
#
# Sets only nvidia at startup
cat "$HOME/.xinitrcprevnvidia" >"$HOME/.xinitrcprev"
cat "$HOME/.xinitrcpostnvidia" >"$HOME/.xinitrcpost"
sudo optimus-manager --set-startup nvidia
