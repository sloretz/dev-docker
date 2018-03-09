FROM ubuntu:16.04

RUN locale-gen en_US en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
 && export LANG=en_US.UTF-8

RUN apt-get update \
 && apt-get install -y \
    lsb-release \
    sudo \
    gdb \
    vim \
    curl \
    git \
    wget \
    build-essential \
    cppcheck \
    cmake \
 && apt-get clean

RUN curl http://repo.ros2.org/repos.key | apt-key add - \
 && sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main xenial main" > /etc/apt/sources.list.d/ros2-latest.list' \
 && apt update \
 && apt install -y `apt list "ros-ardent-*" 2> /dev/null | grep "/" | awk -F/ '{print $1}' | grep -v -e ros-ardent-ros1-bridge -e ros-ardent-turtlebot2- | tr "\n" " "` \
 && apt install -y \
    python3-argcomplete \
    python3-pip \
    python3-setuptools \
 && apt-get clean

RUN curl -ssL http://get.gazebosim.org | sh \
 && apt-get clean

# Make a user matching my user id
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/

COPY settings.bash .settings.bash
RUN echo "source ~/.settings.bash" >> .bashrc

#nvidia docker
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

WORKDIR /workspace
