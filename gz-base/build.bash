#!/usr/bin/env bash
image_name=gz-base
image_plus_tag=$image_name:$(date +%Y_%b_%d_%H%M)

sudo docker build -t $image_plus_tag .
# Make latest point to this build
sudo docker tag $image_plus_tag $image_name
