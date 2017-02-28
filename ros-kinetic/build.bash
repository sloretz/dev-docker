#!/usr/bin/env bash
user_id=$(id -u)
image_name=ros-kinetic
image_plus_tag=$image_name:$(date +%Y_%b_%d_%H%M)

sudo docker build -t $image_plus_tag --build-arg user_id=$user_id .
