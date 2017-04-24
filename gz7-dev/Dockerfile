FROM ubuntu:16.04

# This is a dockerfile for building gazebo
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
        cmake \
        software-properties-common \
 && apt-get clean

# Install gazebo dependencies
# see http://gazebosim.org/tutorials?tut=install_from_source

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

# DART Not working, need to be on trusty for dart 4
RUN sudo apt-add-repository ppa:dartsim

RUN apt-get update \
 && apt-get install -y \
        protobuf-compiler \
        libprotobuf9v5 \
        libqtcore4 \
        libqtgui4 \
        libsdformat4 \
        ttf-dejavu-core \
        libtbb-dev \
        libxml2-dev \
        libtinyxml2-dev \
        libqt4-dev \
        libqtwebkit-dev \
        libprotoc-dev \
        libfreeimage-dev \
        libprotobuf-dev \
        libboost-all-dev \
        freeglut3-dev \
        libogre-1.9-dev \
        libtar-dev \
        libcurl4-openssl-dev \
        libgts-dev \
        libusb-1.0-0-dev \
        libgdal-dev \
        libavformat-dev \
        libavcodec-dev \
        libswscale-dev \
        libsdformat4-dev \
        libignition-math2-dev \
        libsimbody-dev \
        libbullet-dev \
 && apt-get clean

#nvidia docker
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# stuff for gazebo
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:${LD_LIBRARY_PATH}
EXPOSE 11345

ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME
