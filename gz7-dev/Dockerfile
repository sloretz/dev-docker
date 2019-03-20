FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y \
    sudo \
    build-essential \
    cmake \
    wget \
    lsb-release \
 && apt-get clean

RUN /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -'

RUN apt-get update \
 && apt-get install -y \
        ruby \
        protobuf-compiler \
        libprotobuf9v5 \
        libqtcore4 \
        libqtgui4 \
        libsdformat4 \
        ttf-dejavu-core \
        libtbb-dev \
        libxml2-dev \
        libtinyxml-dev \
        libtinyxml2-dev \
        libspnav-dev \
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
        libsimbody-dev \
        libbullet-dev \
 && apt-get clean
