#!/usr/bin/env bash
set -euo pipefail

echo "Installing fonts from all subdirectories..."

# Detect current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Loop through all font directories (skip hidden ones)
for font_dir in */; do
    # Remove trailing slash
    font_name="${font_dir%/}"
    echo "Processing: $font_name"

    # Target install location
    system_font_dir="/usr/share/fonts/truetype/$font_name"
    if [ ! -d "$system_font_dir" ]; then
	echo "Creating: $system_font_dir"
	sudo mkdir -p "$system_font_dir"
    fi

    # Install TTF and OTF files
    find "$font_dir" -type f \( -iname '*.ttf' -o -iname '*.otf' \) | while read -r font_file; do
	font_filename="$(basename "$font_file")"
	echo "  Installing: $font_filename"
        sudo install -m 644 "$font_file" "$system_font_dir/"
    done
done

echo "Updating font cache... Please wait."
fc-cache -f -v
echo "Done. Fonts installed and cache updated."
