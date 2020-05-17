# mapGen.sh

A shellscript to make grid maps from text files.

![Simple map example](examples/simpleBig.jpg)

```
xxxxx
xGGxx
xxooG
xxGox
xxxxx
```

## Dependencies

- A POSIX-compliant shell (`bash`, `dash`, `sh`, `zsh`)
- [ImageMagick](https://imagemagick.org/index.php)
- Tools expected in a Unix environment: `grep`, `sed`, `awk`

## Motivation

The want for Vim to be a map maker.

## Concept

Given a text file in which each character represents a cell, have a script draw that map.

`mapGen.sh` takes as input a text file which ideally has a block of characters of any size but of
rectangular shape with no missing ones. It also takes a folder in which tile images are supposed to
be. For each character in the file it randomly takes one image in that folder which name starts
with that character and composes it into the map image with the help of the `convert` command from
ImageMagick.

## Examples

![Cave dungeon example](examples/caveBig.jpg)

![Tiled dungeon example](examples/tiledDungeonBig.jpg)

Both images obtained from the same input:

```
XXXXXXXXXXXXXXXXXXXX
XXXXXXooooooooXXXXXX
XXXXXXoooooooooXXXXX
XXXXXXooooooooooooXX
XXXXCDooooooooooooDX
XXXXXXooooooooooooXX
XXXXXXooooooooooooXX
XXXXXXoooooooooXXXXX
XXXXXXooooooooXXXXXX
XXXXXXXXXSXXXXXXXXXX
XXXXXXXXooooXXXXXXXX
XXXXXXXooooooXXXXXXX
XXXXXXooooooooXXXXXX
XooooXoooCooooXooooX
XoCooXooooooooXooooX
XooooXooooooooXooooX
XooooXXooooooXXooooX
XooooXXXooooXXXooooX
XooooXXXXooXXXXooooX
XXXoXXXXXooXXXXXooXX
XXXoXXXXooooXXXXooXX
XXXoooooooooooooooXX
XXXXXXooooooooooooXX
XXXXXXXXooooXXXXXXXX
XXXXXXXXXooXXXXXXXXX
XXXXXXXXXooXXXXXXXXX
```

## Usage

```
mapGen.sh [-s SIZE] [-f TILE_FOLDER] [-o OUTPUT_FILE] SOURCE_FILE
```

Where

- `SIZE` is the side of the tile images in pixels (default 8),
- `TILE_FOLDER` is the folder where the tile images are stored (default `./tiles`),
- `OUTPUT_FILE` is the path to the resulting image (default `out.jpg`),
- and `SOURCE_FILE` is the text file with the layout of the map.

## Possibilities

The direct mapping of characters in text file to beginning of tile image name gives flexibility to
either choose characters easy to read on the file or to use characters directly taken from the
image names for easier memorization. Either way, the "configuration" of the relationship is
trivial and freely customizable.

For the examples I used tiles of 8x8 pixels, but other styles could be attained by using bigger
ones. Note that there is no logic for relative location of tiles.
