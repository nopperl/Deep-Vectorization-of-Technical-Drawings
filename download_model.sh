#!/bin/bash
model_dir="./logs/vectorization/curves"
filename="$model_dir/model_curves.weights"
if [ -f $filename ]; then
	exit 0
fi

mkdir -p $model_dir
fileid="18jN37pMvEg9S05sLdAznQC5UZDsLz-za"
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
