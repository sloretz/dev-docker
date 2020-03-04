FROM ubuntu:20.04

# --- modified from ros image template ---

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    vim \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros-testing/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install rosdep
RUN apt-get update && apt-get install --no-install-recommends -y \
    python3-rosdep \
  && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_PYTHON_VERSION=3

# bootstrap rosdep
RUN rosdep init

