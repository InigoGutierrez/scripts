#!/bin/sh
#
# Sets nvidia on at startup
cat "$HOME/.xinitrcprevnvidia" >"$HOME/.xinitrcprev"
cat "$HOME/.xinitrcpostnvidia" >"$HOME/.xinitrcpost"
sudo optimus-manager --set-startup hybrid
