#!/bin/sh

font_dir=/usr/share/fonts/truetype/menlo

# Remove font directory.
echo "Removing fonts..."
sudo rm -rf $font_dir

# Reset font cache on Linux
if which fc-cache >/dev/null 2>&1 ; then
  echo "Resetting font cache, this may take a moment..."
  fc-cache -f "$font_dir"
fi

echo "Menlo font uninstalled from $font_dir"

# You can confirm that the Menlo font were uninstalled with the following
# command:
# fc-list | grep Menlo
