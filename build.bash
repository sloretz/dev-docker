#!/usr/bin/env bash

if [ $# -eq 0 ]
then
    echo "Usage: $0 image-name..."
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $DIR/$1 ]
then
  echo "image-name must be a directory in the same folder as this script"
  exit 2
fi

user_id=$(id -u)
image_name=$(basename $1)
image_plus_tag=$image_name:$(date +%Y_%b_%d_%H%M)

sudo docker build -t $image_plus_tag --no-cache --build-arg user_id=$user_id $DIR/$image_name
sudo docker tag $image_plus_tag $image_name:latest
