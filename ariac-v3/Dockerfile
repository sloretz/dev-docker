FROM osrf/ros:melodic-desktop-full

RUN apt-get update \
 && apt-get install -y \
    locales \
 && locale-gen en_US.UTF-8 \
 && update-locale en_US.UTF-8 \
 && apt-get clean

RUN apt-get update \
 && apt-get install -y \
    wget \
    gnupg \
    python-catkin-tools \
    ros-melodic-ros-controllers \
 && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable bionic main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O /tmp/gazebo.key  \
 && apt-key add /tmp/gazebo.key \
 && rm /tmp/gazebo.key \
 && apt-get update \
 && apt-get install -y \
    gazebo9 \
    libgazebo9-dev \
 && apt-get clean

RUN echo ". /usr/share/gazebo/setup.sh" >> /etc/bash.bashrc
