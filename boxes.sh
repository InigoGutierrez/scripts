#!/bin/sh

for design in $(boxes -l | egrep '^\w(\w|-)*$'); do
	echo "Box: $design"
	echo ""
	echo "Fortuna audaces iuvat" | boxes -d "$design"
	echo ""
	echo "===================="
	echo ""
done
