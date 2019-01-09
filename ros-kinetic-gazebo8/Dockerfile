FROM osrf/ros:kinetic-desktop-full

RUN apt-get update \
 && apt-get remove -y \
    ros-kinetic-gazebo* \
    gazebo* \
    libgazebo* \
 && apt-get install -y \
    wget \
    gnupg \
 && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O /tmp/gazebo.key  \
 && apt-key add /tmp/gazebo.key \
 && rm /tmp/gazebo.key \
 && apt-get update \
 && apt-get install -y \
    ros-kinetic-gazebo8-ros-pkgs \
    gazebo8 \
    libgazebo8-dev \
 &&  apt-get clean

RUN echo ". /usr/share/gazebo/setup.sh" >> /etc/bash.bashrc