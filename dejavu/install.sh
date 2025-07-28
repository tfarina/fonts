#!/usr/bin/env bash

font_list=("DejaVuSans-BoldOblique.ttf" \
           "DejaVuSans-Bold.ttf" \
           "DejaVuSansCondensed-BoldOblique.ttf" \
           "DejaVuSansCondensed-Bold.ttf" \
           "DejaVuSansCondensed-Oblique.ttf" \
           "DejaVuSansCondensed.ttf" \
           "DejaVuSans-ExtraLight.ttf" \
           "DejaVuSansMono-BoldOblique.ttf" \
           "DejaVuSansMono-Bold.ttf" \
           "DejaVuSansMono-Oblique.ttf" \
           "DejaVuSansMono.ttf" \
           "DejaVuSans-Oblique.ttf" \
           "DejaVuSans.ttf" \
           "DejaVuSerif-BoldItalic.ttf" \
           "DejaVuSerif-Bold.ttf" \
           "DejaVuSerifCondensed-BoldItalic.ttf" \
           "DejaVuSerifCondensed-Bold.ttf" \
           "DejaVuSerifCondensed-Italic.ttf" \
           "DejaVuSerifCondensed.ttf" \
           "DejaVuSerif-Italic.ttf" \
           "DejaVuSerif.ttf")

for file in ${font_list[*]}; do
  echo $file
done

font_dir=/usr/share/fonts/truetype/dejavu

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
# fc-list | grep DejaVu
