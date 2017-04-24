#!/usr/bin/env bash

if [ $# -ne 3 ]
then
    echo "Usage: $0 <docker image> <dir with sourcecode> <dir to save buildstuff>"
    exit 1
fi

IMG=$1
SRC_DIR=$2
BUILD_DIR=$3

# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

DOCKER_OPTS=

VIMRC=~/.vimrc
if [ -f $VIMRC ]
then
  DOCKER_OPTS="$DOCKER_OPTS -v $VIMRC:/home/developer/.vimrc:ro"
fi

sudo nvidia-docker run -it \
  -e DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "$XAUTH:$XAUTH" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  --rm=true \
  --security-opt seccomp=unconfined \
  $DOCKER_OPTS \
  -v "$SRC_DIR:/src_rw" \
  -v "$SRC_DIR:/src:ro" \
  -v "$BUILD_DIR:/build" \
  $1
