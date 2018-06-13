#!/usr/bin/env bash

if [ $# -eq 0 ]
then
    echo "Usage: $0 directory-name"
    exit 1
fi

# get path to current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $DIR/$1 ]
then
  echo "image-name must be a directory in the same folder as this script"
  exit 2
fi

user_id=$(id -u)
image_name=$(basename $1)
image_plus_tag=$image_name:$(date +%Y_%b_%d_%H%M)

docker build --rm -t $image_plus_tag --build-arg user_id=$user_id $DIR/$image_name
docker tag $image_plus_tag $image_name:latest

echo "Built $image_plus_tag and tagged as $image_name:latest"
