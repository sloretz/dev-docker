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
if [ -e $SPNAV_SOCK ]
then
  echo "Spacenav enabled"
  DOCKER_OPTS="$DOCKER_OPTS -v /var/run/spnav.sock:/var/run/spnav.sock"
else
  echo "Spacenav disabled"
fi

for WS_DIR in ${WORKSPACES[@]}
do
  WS_DIRNAME=$(basename $WS_DIR)
  if [ ! -d $WS_DIR/src ]
  then
    echo "Other! $WS_DIR"
    DOCKER_OPTS="$DOCKER_OPTS -v $WS_DIR:/home/developer/other/$WS_DIRNAME"
  else
    echo "Workspace! $WS_DIR"
    DOCKER_OPTS="$DOCKER_OPTS -v $WS_DIR:/home/developer/workspaces/$WS_DIRNAME"
  fi
done

# Determine if image has a folder for ccache use, and if so mount a ramdisk for the cache
ccache_size=$(docker inspect --format "{{ index .Config.Labels \"sloretz.ccache.size\"}}" $IMG)
ccache_location=$(docker inspect --format "{{ index .Config.Labels \"sloretz.ccache.location\"}}" $IMG)

if [[ ! -z $ccache_size ]]
then
  echo "Ccache ${ccache_location} size ${ccache_size}"
  DOCKER_OPTS="$DOCKER_OPTS --tmpfs ${ccache_location}:rw,noexec,nosuid,size=${ccache_size},mode=777"
fi


# --device=/dev/input/js0 \
# --tmpfs /ccache:rw,noexec,nosuid,size=2000000k \
sudo docker run -it \
  -e DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "$XAUTH:$XAUTH" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  --rm \
  --runtime=nvidia \
  --security-opt seccomp=unconfined \
  $DOCKER_OPTS \
  $IMG
