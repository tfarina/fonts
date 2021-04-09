#!/bin/sh

font_dir=/usr/share/fonts/truetype/hack

if [ -d $font_dir ]; then
  echo "Found directory: " $font_dir
else
  echo "Creating directory: " $font_dir
  sudo mkdir -p $font_dir
fi

cd truetype/hack

echo "Installing font"

for file in Hack-Bold.ttf Hack-BoldItalic.ttf Hack-Italic.ttf Hack-Regular.ttf; do
  sudo chown root:root "${file}"
  sudo cp "${file}" $font_dir
done

# Clear and regenerate your font cache and indexes with the following command:
# fc-cache -f -v
#
# You can confirm that the fonts are installed with the following command:
# fc-list | grep Hack
