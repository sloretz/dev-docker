FROM ubuntu:18.04 

RUN apt-get update \
 && apt-get install -y \
    wget \
    gnupg \
 && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable bionic main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O /tmp/gazebo.key  \
 && apt-key add /tmp/gazebo.key \
 && rm /tmp/gazebo.key \
 && apt-get update \
 && apt-get install -y \
    gazebo9 \
    libgazebo9-dev \
 &&  apt-get clean

RUN echo ". /usr/share/gazebo/setup.sh" >> /etc/bash.bashrc