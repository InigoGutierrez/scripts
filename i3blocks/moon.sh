#!/bin/sh

# Shows an emoji with the phase of the moon

pom | grep -q "New Moon" && moon=🌑
pom | grep -q "Waxing Crescent" && moon=🌒
pom | grep -q "First Quarter" && moon=🌓
pom | grep -q "Waxing Gibbous" && moon=🌔
pom | grep -q "Full moon" && moon=🌕
pom | grep -q "Waning Gibbous" && moon=🌖
pom | grep -q "Last Quarter" && moon=🌗
pom | grep -q "Waning Crescent" && moon=🌘
echo "$moon"

