# Personal Fonts Repository

This repository contains my personal collection of fonts used primarily
for the terminal and system UI. It helps me easily switch fonts and keep
them backed up.

## Fonts

The fonts are organized into directories by name:

- `consolas/`
- `dejavu/`
- `fixedsys/`
- `hack/`
- `inconsolata/`
- `menlo/`
- `ubuntu/`

Each directory contains the `.ttf` font files and an `install.sh` script.

## Installation

To install a font, run the `install.sh` script inside the font's directory.
For example:

```bash
cd ubuntu
./install.sh
```

The script will copy the font files to your system fonts directory and
update the font cache.

## Adding New Fonts

To add a new font:

1. Create a new directory with the font's name.
2. Add the .ttf files.
3. Write an install.sh script based on the existing ones.
4. Commit and push your changes.
