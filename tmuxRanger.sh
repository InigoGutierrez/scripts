#!/bin/sh

# Opens a file with nvim in a new tmux pane

tmux new-window -a -t 0 -n nvim "nvim $1"
