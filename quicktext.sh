#!/bin/sh

# Selects a string from a file of frequently used strings

dmenu -i -p "Choose a string: " <"$HOME/.config/quicktext" | xsel -bi
