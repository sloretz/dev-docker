FROM devbase-bionic

RUN sudo /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -'

# dependencies for gazebo, ignition libraries, and sdformat
RUN sudo apt-get update \
 && sudo apt-get install -y \
    libprotobuf-dev \
    libprotoc-dev \
    protobuf-compiler \
    libfreeimage-dev \
    libtinyxml2-dev \
    pkg-config \
    uuid-dev \
    libgts-dev \
    libswscale-dev \
    libavdevice-dev \
    libavformat-dev \
    libavcodec-dev \
    libglew-dev \
    libogre-1.9-dev \
    libzmq3-dev \
    libsqlite3-dev \
    sqlite3 \
    libtinyxml-dev \
    ruby-dev \
 && sudo apt-get clean

# Open port used to talk to gzserver
EXPOSE 11345
