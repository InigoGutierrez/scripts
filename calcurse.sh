#!/bin/sh

# Opens calcurse with git syncronization

cd "$HOME/.calcurse" || exit
git pull
calcurse
git add .
git commit -m "$(date)"
git push
