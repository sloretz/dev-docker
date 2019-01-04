# Ubuntu 18.04 with nvidia-docker2 beta opengl support
FROM nvidia/opengl:1.0-glvnd-devel-ubuntu18.04

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
        ccache \
 && apt-get clean

# Setup ccache
ARG ccache_size=2000000k
RUN /usr/sbin/update-ccache-symlinks \
 && touch /etc/ccache.conf \
 && /bin/sh -c 'echo "cache_dir = /ccache\n" >> /etc/ccache.conf' \
 && /bin/sh -c 'echo "max_size = ${ccache_size}" >> /etc/ccache.conf'

LABEL "sloretz.ccache.size"="${ccache_size}" "sloretz.ccache.location"="/ccache"

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

# Add paths for ccache
RUN /bin/sh -c 'echo "export PATH=/usr/lib/ccache:\$PATH" >> ~/.bashrc'

# Make a couple folders for organizing docker volumes
RUN mkdir ~/workspaces ~/other

# Install colcon
RUN pip3 install -U --user setuptools \
 && pip3 install --user colcon-common-extensions colcon-spawn-shell \
 && /bin/sh -c 'echo "export PATH=\$PATH:/home/developer/.local/bin" >> ~/.bashrc' \
 && /bin/sh -c 'echo "export LD_LIBRARYPATH=\$LD_LIBRARY_PATH:/home/developer/.local/lib" >> ~/.bashrc'

# When running a container start in the developer's home folder
WORKDIR /home/$USERNAME
