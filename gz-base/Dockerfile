FROM ubuntu:16.04

# This is a dockerfile for building gazebo + ignition + sdformat
# The source code for these libraries lives outside the docker container, and is brought
# inside via a docker volume. The libraries can be built and run from inside this container

# Need these to do useful stuff below
RUN apt-get update \
 && apt-get install -y \
        wget \
        lsb-release \
        sudo \
        mercurial \
        vim \
        gdb \
 && apt-get clean

# Install gazebo dependencies
# see http://gazebosim.org/tutorials?tut=install_from_source

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN wget https://bitbucket.org/osrf/release-tools/raw/default/jenkins-scripts/lib/dependencies_archive.sh -O /tmp/dependencies.sh

# Required and optional dependencies
# Strips ignition and sdformat so they can be built from source
RUN bash -c 'ROS_DISTRO=Dummy source /tmp/dependencies.sh \
 && apt-get update \
 && deps=" \
        $BASE_DEPENDENCIES \
        $GAZEBO_BASE_DEPENDENCIES \
        $GAZEBO_EXTRA_DEPENDENCIES \
        $SDFORMAT_BASE_DEPENDENCIES \
        $IGN_COMMON_DEPENDENCIES \
        $IGN_TRANSPORT_DEPENDENCIES \
        libgflags-dev \
        " \
 && deps=$(sed "s/libignition[a-zA-Z0-9_-]*//g" <<< $deps) \
 && deps=$(sed "s/libsdformat[a-zA-Z0-9_-]*//g" <<< $deps) \
 && deps=$(sed "s/\\\ //g" <<< $deps) \
 && apt-get install -y \
        $deps \
 && apt-get clean'

#nvidia docker
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# stuff for gazebo
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:${LD_LIBRARY_PATH}
EXPOSE 11345
