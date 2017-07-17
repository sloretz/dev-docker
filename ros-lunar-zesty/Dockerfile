FROM ubuntu:17.04

# Prerequisite dependencies
RUN apt-get update \
 && apt-get install -y \
    lsb-release \
    wget \
    sudo \
    git \
    dirmngr \
 && apt-get clean


# Get ROS Lunar
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list \
 && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 \
 && apt-get update \
 && apt-get install -y \
    ros-lunar-desktop-full \
    python-catkin-tools \
    python-rosinstall \
 && rosdep init \
 && apt-get clean

# Make a user matching my user id
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME


# Don't run this step as root
# RUN rosdep update

