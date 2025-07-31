#!/usr/bin/env bash
#
# Usage:
#   ./install.sh [fontname ...] > install.log 2>&1
#   Run with specific font directories or leave empty to install all.
#
set -euo pipefail

dry_run=0
args=()

# Detect current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

while [[ "$#" -gt 0 ]]; do
    case "$1" in
	--dry-run)
	    dry_run=1
	    ;;
	-*) # catch all other flags
	    echo "Warning: unknown option '$1'"
	    ;;
	*)
            args+=("$1")
            ;;
    esac
    shift
done

# Collect target font directories
if [ "${#args[@]}" -eq 0 ]; then
    # No arguments: install all subdirs
    font_dirs=(*/)
else
    # Only install fonts passed as arguments
    font_dirs=()
    for name in "${args[@]}"; do
	if [ -d "$name" ]; then
	    font_dirs+=("$name/")
	else
	    echo "Warning: font directory '$name' not found. Skipping."
	fi
    done
fi

if [ "${#font_dirs[@]}" -eq 0 ]; then
    echo "No valid font directories found. Exiting."
    exit 1
fi

echo "Installing fonts from: ${font_dirs[*]}"

# Loop through all font directories (skip hidden ones)
for font_dir in "${font_dirs[@]}"; do
    # Remove trailing slash
    font_name="${font_dir%/}"
    echo "Processing: $font_name"

    # Target install location
    system_font_dir="/usr/share/fonts/truetype/$font_name"
    if [ ! -d "$system_font_dir" ]; then
	if [ "$dry_run" -eq 1 ]; then
	    echo "  [dry-run] Would create: $system_font_dir"
	else
	    echo "  Creating: $system_font_dir"
	    sudo mkdir -p "$system_font_dir"
	fi
    fi

    # Install TTF and OTF files
    find "$font_dir" -type f \( -iname '*.ttf' -o -iname '*.otf' \) | while read -r font_file; do
	font_filename="$(basename "$font_file")"
	if [ "$dry_run" -eq 1 ]; then
	    echo "    [dry-run] Would install: $font_filename → $system_font_dir/"
	else
	    echo "    Installing: $font_filename"
	    sudo install -m 644 "$font_file" "$system_font_dir/"
        fi
    done
done

if [ "$dry_run" -eq 1 ]; then
    echo "[dry-run] Would update font cache with fc-cache -f -v"
else
    echo "Updating font cache... Please wait."
    fc-cache -f -v
    echo "Done. Fonts installed and cache updated."
fi
