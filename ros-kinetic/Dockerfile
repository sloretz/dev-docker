FROM ubuntu:16.04

# Prerequisite dependencies
RUN apt-get update \
 && apt-get install -y \
    lsb-release \
    wget \
    sudo \
    git \
 && apt-get clean


# Get ROS kinetic
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list \
 && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116 \
 && apt-get update \
 && apt-get install -y \
    ros-kinetic-desktop-full \
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
RUN rosdep update
