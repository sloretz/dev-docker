FROM ubuntu:18.04 

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
    tzdata \
    locales \
    sudo \
    lsb-release \
 && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && locale-gen en_US en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
 && apt-get clean

# Setup sources
RUN apt update \
 && apt install -y curl gnupg2 \
 && ( curl http://repo.ros2.org/repos.key | apt-key add - ) \
 && /bin/sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

# Install ros 2 packags
ENV ROS_DISTRO=crystal
RUN apt-get update \
 && apt install -y ros-$ROS_DISTRO-desktop \
 && apt-get clean

# Environment Setup
RUN apt-get update \
 && apt install -y python3-argcomplete \
 && /bin/sh -c 'echo ". /opt/ros/crystal/setup.bash" >> ~/.bashrc' \
 && apt-get clean

# Installing additional RMW implementations
RUN apt-get update \
 && apt-get install -y ros-$ROS_DISTRO-rmw-opensplice-cpp \
# TODO how to install connext in a non-interactive mode?
#  && RTI_NC_LICENSE_ACCEPTED=yes sudo apt-get install -y rti-connext-dds-5.3.1 \
#  && sudo apt-get install -y ros-$ROS_DISTRO-rmw-connext-cpp \
 && apt-get clean