FROM devbase-bionic

RUN export DEBIAN_FRONTEND=noninteractive \
 && sudo apt-get update \
 && sudo -E apt-get install -y \
    tzdata \
 && sudo ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && sudo dpkg-reconfigure --frontend noninteractive tzdata \
 && sudo apt-get clean

RUN sudo /bin/sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' \
 && sudo /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' \
 && ( wget -O - http://repo.ros2.org/repos.key | sudo apt-key add - ) \
 && ( wget -O - http://packages.osrfoundation.org/gazebo.key | sudo apt-key add - ) \
 && sudo apt-get update \
 && sudo apt-get install -y \
    gazebo9 \
    libgazebo9-dev \
    `apt list "ros-bouncy-*" 2> /dev/null | \
      grep '/' | awk -F/ '{print $1}' | \
      grep -v -e ros-bouncy-ros1-bridge \
      -e ros-bouncy-turtlebot2- \
      -e "ros-bouncy.*-dbgsym" \
      -e "ros-bouncy-.*opensplice" \
      -e "ros-bouncy-.*connext" | tr '\n' ' '` \
 && sudo apt-get clean

RUN /bin/sh -c 'echo ". /opt/ros/bouncy/setup.bash" >> ~/.bashrc' \
 && /bin/sh -c 'echo ". /usr/share/gazebo/setup.sh" >> ~/.bashrc'
