#!/bin/bash

font_list=("UbuntuMono-B.ttf" \
           "UbuntuMono-BI.ttf" \
	   "UbuntuMono-R.ttf" \
           "UbuntuMono-RI.ttf")

for file in ${font_list[*]}; do
  echo $file
done

font_dir=/usr/share/fonts/truetype/ubuntu-font-family

if [ -d $font_dir ]; then
  echo "Found directory: " $font_dir
else
  echo "Creating directory: " $font_dir
  sudo mkdir -p $font_dir
fi

echo "Installing font..."

for file in ${font_list[*]}; do
  # TODO: do not copy the file if it already exists.
  sudo cp "${file}" $font_dir
done

# Clear and regenerate your font cache and indexes.

echo "Updating font cache... Please, wait."
fc-cache -f -v
echo "Finished. Your font cache has been updated."

# Confirm the fonts were installed with the following command:
# fc-list | grep Ubuntu
