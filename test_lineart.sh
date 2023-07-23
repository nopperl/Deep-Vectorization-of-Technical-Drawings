#!/bin/sh
filename=$1
python run_pipeline.py --primitive_type curve --gpu 0 --data_dir /data/ --json_path /code/Deep-Vectorization-of-Technical-Drawings/vectorization/models/specs/resnet18_blocks1_bn_64__c2h__trans_heads4_feat256_blocks8_ffmaps512__h2o__out512.json --model_path /logs/vectorization/curves/model_curves.weights --image_name $filename
