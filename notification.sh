#!/bin/bash
chosen=myselection
pgrep -x dunst && notify-send "$chosen mynotif."
