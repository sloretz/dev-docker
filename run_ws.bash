#!/usr/bin/env bash

if [ $# -lt 1 ]
then
    echo "Usage: $0 <docker image> [<dir with workspace> ...]"
    exit 1
fi


IMG=$(basename $1)

ARGS=("$@")
WORKSPACES=("${ARGS[@]:1}")

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

SPNAV_SOCK=/var/run/spnav.sock
if [ -f $SPNAV_SOCK ]
then
  DOCKER_OPTS="$DOCKER_OPTS -v /var/run/spnav.sock:/var/run/spnav.sock"
fi

for WS_DIR in ${WORKSPACES[@]}
do
  WS_DIRNAME=$(basename $WS_DIR)
  if [ ! -d $WS_DIR/src ]
  then
    echo "Other! $WS_DIR"
    DOCKER_OPTS="$DOCKER_OPTS -v $WS_DIR:/other/$WS_DIRNAME"
  else
    echo "Workspace! $WS_DIR"
    DOCKER_OPTS="$DOCKER_OPTS -v $WS_DIR:/workspace/$WS_DIRNAME"
  fi
done

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
  $IMG
