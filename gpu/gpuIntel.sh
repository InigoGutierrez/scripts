#!/bin/sh
#
# Sets off nvidia at startup
cat "$HOME/.xinitrcprevintel" >"$HOME/.xinitrcprev"
cat "$HOME/.xinitrcpostintel" >"$HOME/.xinitrcpost"
sudo optimus-manager --set-startup intel
