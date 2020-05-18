#!/bin/bash

make_image_classifier \
  --image_dir ./training_data/images \
  --tfhub_module https://tfhub.dev/google/tf2-preview/mobilenet_v2/feature_vector/4 \
  --image_size 224 \
  --saved_model_dir ./training_data/models \
  --labels_output_file ./training_data/star_wars_class_labels.txt \
  --tflite_output_file ./training_data/star_wars_model.tflite
