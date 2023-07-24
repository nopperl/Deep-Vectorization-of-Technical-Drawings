#!/bin/sh
apt-get update && apt-get install -y imagemagick time
input_dir=/code/Deep-Vectorization-of-Technical-Drawings/data
cd /code/Deep-Vectorization-of-Technical-Drawings
./download_model.sh
. /opt/.venv/vect-env/bin/activate
find $input_dir -type f -name '*.png' -exec basename {} \; | xargs -L1 -I{} ./test_lineart.sh {}
find logs/outputs/vectorization/lines/merging_output -maxdepth 1 -name '*.svg' -exec ./fix_aspect_ratio.sh {} \;
