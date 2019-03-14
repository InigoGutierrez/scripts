#!/bin/sh

cat $HOME/.paths | fzf | awk '{print $3}'
