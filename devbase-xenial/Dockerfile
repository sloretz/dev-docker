# Ubuntu 16.04 with nvidia-docker2 beta opengl support
FROM nvidia/opengl:1.0-glvnd-devel-ubuntu16.04

# Tools I find useful during development
RUN apt-get update \
 && apt-get install -y \
        wget \
        lsb-release \
        sudo \
        mercurial \
        git \
        vim \
        cmake \
        gdb \
        software-properties-common \
        python3-dbg \
        python3-pip \
        python3-venv \
        build-essential \
 && apt-get clean

# Add a user with the same user_id as the user outside the container
# Requires a docker build argument `user_id`
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME

# Commands below run as the developer user
USER $USERNAME

# Make a couple folders for organizing docker volumes
RUN mkdir ~/workspaces ~/other

# Install colcon
RUN pip3 install -U --user setuptools \
 && pip3 install --user colcon-common-extensions colcon-spawn-shell

# When running a container start in the developer's home folder
WORKDIR /home/$USERNAME
