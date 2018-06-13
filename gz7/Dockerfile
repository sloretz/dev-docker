FROM devbase-xenial

RUN sudo /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -' \
 && sudo apt-get update \
 && sudo apt-get install -y \
    gazebo7 \
    libgazebo7-dev \
 && sudo apt-get clean

RUN /bin/sh -c 'echo ". /usr/share/gazebo/setup.sh" >> ~/.bashrc'

EXPOSE 11345
