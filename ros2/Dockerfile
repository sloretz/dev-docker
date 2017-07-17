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
    mercurial \
 && apt-get clean

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' \
 && apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

RUN apt-get update \
 && apt-get install -y \
    git \
    wget \
    build-essential \
    cppcheck \
    cmake \
    libopencv-dev \
    libpoco-dev \
    libpocofoundation9v5 \
    libpocofoundation9v5-dbg \
    python-empy \
    python3-dev \
    python3-empy \
    python3-nose \
    python3-pip \
    python3-setuptools \
    python3-vcstool \
    python3-yaml \
    libtinyxml-dev \
    libeigen3-dev \
    clang-format \
    pydocstyle \
    pyflakes \
    python3-coverage \
    python3-mock \
    python3-pep8 \
    uncrustify \
    libasio-dev \
    libtinyxml2-dev \
 && apt-get clean

RUN pip3 install \
    argcomplete \
    flake8 \
    flake8-import-order

# Make a user matching my user id
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME
