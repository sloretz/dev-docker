FROM ubuntu:14.04

# Prerequisite dependencies
RUN apt-get update \
 && apt-get install -y \
    lsb-release \
    wget \
    sudo \
    gdb \
 && apt-get clean


# Get ROS indigo
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list \
 && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116 \
 && apt-get update \
 && apt-get install -y \
    ros-indigo-desktop-full \
    python-catkin-tools \
 && rosdep init \
 && apt-get clean

# Get gazebo from ubunto repo
RUN apt-get update \
 && apt-get install -y \
    gazebo2 \
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

LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# Don't run this step as root
RUN rosdep update
