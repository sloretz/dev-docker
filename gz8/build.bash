#!/usr/bin/env bash
user_id=$(id -u)
image_name=gz8
image_plus_tag=$image_name:$(date +%Y_%b_%d_%H%M)

sudo docker build -t $image_plus_tag --build-arg user_id=$user_id .
# Make latest point to this build
sudo docker tag $image_plus_tag $image_name
