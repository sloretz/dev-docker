# Debian Buster is likely a target platform of ROS Noetic
FROM debian:buster

# --- modified from ros image template ---

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_PYTHON_VERSION=3

# bootstrap rosdep
RUN rosdep init

RUN apt-get update \
 && apt-get install -y \
    binutils \
    xz-utils \
    python3-rosinstall-generator \
    python3-pip \
    python3-vcstool \
    git \
    vim \
    cmake \
    python3-paramiko \
    liburdfdom-dev \
    liburdfdom-headers-dev \
    libtinyxml-dev \
    libtinyxml2-dev \
    python3-empy \
    libboost-all-dev \
    python3-nose \
    libgtest-dev \
    python3-mock \
    pkg-config \
    sbcl \
    libconsole-bridge-dev \
    google-mock \
    python3-coverage \
    libpython2.7-stdlib \
    graphviz \
    libeigen3-dev \
    qt5-qmake \
    pyqt5-dev \
    python3-pyqt5 \
    python3-pyqt5.qtsvg \
    python3-sip-dev \
    qtbase5-dev \
    tango-icon-theme \
    liblz4-dev \
    libbz2-dev \
    python3-pil \
    libbullet-dev \
    libcppunit-dev \
    python3-netifaces \
    qtbase5-dev \
    libpoco-dev \
    python3-pydot \
    python3-pygraphviz \
    uuid-dev \
    libcurl4-openssl-dev \
    curl \
    libgpgme-dev \
    libssl-dev \
    python3-numpy \
    python3-psutil \
    python3-lxml \
    libapr1-dev \
    libaprutil1-dev \
    liblog4cxx-dev \
    python3-pycryptodome \
    python3-gnupg \
    python3-defusedxml \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
