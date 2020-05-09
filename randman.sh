#!/bin/sh
#
# randman.sh
#
# Opens a random man page from section 1: Executable programs or shell commands.
# Inspired by DistroTube: https://www.youtube.com/watch?v=vrN5SPeVUu0

man "$(find /usr/share/man/man1/ -type f | shuf | sed 1q | sed '{s|.*/||; s|\.gz$||}')"
