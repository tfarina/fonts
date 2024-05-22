#!/bin/sh

font_dir=/usr/share/fonts/truetype/inconsolata

# Remove font directory
echo "Removing Inconsolata..."
sudo rm -rf $font_dir

# Reset font cache
if which fc-cache >/dev/null 2>&1 ; then
  echo "Resetting font cache, this may take a moment..."
  fc-cache -f "$font_dir"
fi

echo "Inconsolata font uninstalled from $font_dir"

# You can confirm that the Inconsolata font were uninstalled with the following
# command:
# fc-list | grep Inconsolata
