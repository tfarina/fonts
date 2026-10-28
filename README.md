# Personal Fonts Repository

This repository contains a curated collection of fonts I use for terminal work, coding, and general desktop use. The project is intentionally simple: each font family lives in its own directory and is installed with a single script at the repository root.

## Fonts

The fonts are organized into directories by name:

- `dejavu/`
- `fixedsys/`
- `hack/`
- `inconsolata/`
- `menlo/`
- `ubuntu/`

Each directory contains the font files for that family, typically `.ttf` and/or `.otf` files.

## Installation

From the repository root, run:

```bash
./install.sh
```

This installs every font directory found in the repo. To install only specific families:

```bash
./install.sh dejavu hack ubuntu
```

To preview what would happen without changing the system:

```bash
./install.sh --dry-run
```

The script will:

- detect font directories under the repo
- create `/usr/share/fonts/truetype/<font-name>/` as needed
- copy matching `.ttf` and `.otf` files into the system font directory
- refresh the font cache with `fc-cache -f -v`

This is intended for Linux systems with `fc-cache` installed and uses `sudo` when creating directories and installing files.

## Adding New Fonts

To add a new font:

1. Create a new directory with the font's name.
2. Add the font files (`.ttf` or `.otf`).
3. Keep the font family in the same repo structure used by the existing directories.
4. Run the root `install.sh` script or install the new directory manually.
5. Commit and push your changes.

## Selecting the Default Font on XFCE 4.12

If you use XFCE, you can set a font as the default after installation:

1. Open **Settings Manager** → **Appearance** → **Fonts**.
2. Choose your preferred font from the dropdown list.
3. Adjust size and antialiasing options if needed.

For window title fonts:

1. Open **Settings Manager** → **Window Manager** → **Style** tab.
2. Select your font under the **Title font** section.

The change takes effect immediately across XFCE.
