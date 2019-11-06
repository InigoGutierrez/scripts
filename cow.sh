#!/bin/sh

for cow in $(cowsay -l); do
	echo "Cow: $cow"
	echo ""
	echo "Alea jacta est" | cowsay -f "$cow"
	echo ""
	echo "===================="
	echo ""
done
