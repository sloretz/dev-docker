FROM devbase-trusty

RUN sudo /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -'

RUN sudo apt-add-repository ppa:dartsim

RUN sudo apt-get update \
 && sudo apt-get install -y \
        ruby \
        protobuf-compiler \
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
 && sudo apt-get clean

EXPOSE 11345
