FROM ubuntu:18.04

# Install dependencies
RUN apt-get update \
 && apt-get install -y \
    sudo \
    lsb-release \
    wget \
    git \
    gnupg2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install ROS
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list \
 && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 \
 && apt-get update \
 && apt-get install -y \
    ros-melodic-desktop-full \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init \
 && rosdep update

# Install Gazebo
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O /tmp/gazebo.key  \
 && apt-key add /tmp/gazebo.key \
 && rm /tmp/gazebo.key \
 && apt-get update \
 && apt-get install -y \
    gazebo9 \
    libgazebo9-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

