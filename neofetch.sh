#!/bin/bash
# Wrapper for neofetch

neofetch \
--disable term \
--block_width 3 \
--block_height 1 \
--block_range 0 15 \
--underline_char o \
--gtk2 off \
--gtk3 off

read -rsp "" -d "q" 
