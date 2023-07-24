#!/bin/bash
input_dir="data"
svg_image=$1
svg_image_name=$(basename "$svg_image")
input_image="$input_dir/${svg_image_name/svg/png}"
echo $svg_image_name
echo $input_image
if [ -f "$input_image" ]; then
	echo $input_image
	width=$(identify -format '%w' "$input_image")
	height=$(identify -format '%h' "$input_image")
	svg_def='<svg xmlns="http://www.w3.org/2000/svg" xmlns:ev="http://www.w3.org/2001/xml-events" xmlns:xlink="http://www.w3.org/1999/xlink" baseProfile="full" height="'$height'px" version="1.1" viewBox="0 0 '$width' '$height'" width="'$width'px">'
	sub_cmd="2s|.*|$svg_def|"
	sed -i "$sub_cmd" "$svg_image"
fi
