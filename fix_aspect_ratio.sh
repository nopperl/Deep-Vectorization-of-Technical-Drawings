#!/bin/bash
input_dir="./data"
output_dir="logs/outputs/vectorization/lines/merging_output"

for input_image in "$input_dir"/*; do
	filename=$(basename $input_image)
	svg_image=$output_dir/$filename
	svg_image=${svg_image/png/svg}
	echo $svg_image
	width=$(identify -format '%w' $input_image)
	height=$(identify -format '%h' $input_image)
	svg_def='<svg xmlns="http://www.w3.org/2000/svg" xmlns:ev="http://www.w3.org/2001/xml-events" xmlns:xlink="http://www.w3.org/1999/xlink" baseProfile="full" height="'$height'px" version="1.1" viewBox="0 0 '$width' '$height'" width="'$width'px">'
	if [ -f $svg_image ]; then
		echo $svg_image
		sub_cmd="2s|.*|$svg_def|"
		sed -i "$sub_cmd" $svg_image
	fi
done
