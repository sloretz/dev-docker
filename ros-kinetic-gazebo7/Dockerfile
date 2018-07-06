FROM devbase-xenial

RUN sudo /bin/sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' \
 && sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 \
 && sudo /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -' \
 && sudo apt-get update \
 && sudo apt-get install -y \
    ros-kinetic-desktop-full \
    gazebo7 \
    libgazebo7-dev \
    python-catkin-tools \
    python-rosinstall \
 && sudo rosdep init \
 && sudo apt-get clean

RUN rosdep update

RUN /bin/sh -c 'echo ". /opt/ros/kinetic/setup.bash" >> ~/.bashrc' \
 && /bin/sh -c 'echo ". /usr/share/gazebo/setup.sh" >> ~/.bashrc'
