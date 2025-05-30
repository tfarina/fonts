#!/bin/bash

font_list=("Menlo-Bold.ttf" \
           "Menlo-BoldItalic.ttf" \
	   "Menlo-Italic.ttf" \
           "Menlo-Regular.ttf")

for file in ${font_list[*]}; do
  echo $file
done

font_dir=/usr/share/fonts/truetype/menlo

if [ -d $font_dir ]; then
  echo "Found directory: " $font_dir
else
  echo "Creating directory: " $font_dir
  sudo mkdir -p $font_dir
fi

echo "Installing font..."

for file in ${font_list[*]}; do
  sudo chown root:root "${file}"
  sudo cp "${file}" $font_dir
done

# Clear and regenerate your font cache and indexes.

echo "Updating font cache... Please, wait."
fc-cache -f -v
echo "Finished. Your font cache has been updated."

# You can confirm that the fonts are installed with the following command:
# fc-list | grep Menlo
