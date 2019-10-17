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
    pkg-config \
    libboost-all-dev \
    uuid-dev \
    python3-numpy \
    python3-psutil \
    python3-defusedxml \
    python3-empy \
    google-mock \
    libgtest-dev \
    python3-nose \
    python3-mock \
    python-wxtools \
    libeigen3-dev \
    libconsole-bridge-dev \
    libpoco-dev \
    libbz2-dev \
    python3-pil \
    liburdfdom-headers-dev \
    libtinyxml-dev \
    libtinyxml2-dev \
    libbullet-dev \
    python-pyqt5.qtopengl \
    liblz4-dev \
    libcppunit-dev \
    liburdfdom-dev \
    python-sip-dev \
    python3-paramiko \
    qtbase5-dev \
    python-catkin-pkg \
    qt5-qmake \
    pyqt5-dev \
    python3-pyqt5 \
    python3-pyqt5.qtsvg \
    python3-sip-dev \
    qtbase5-dev \
    tango-icon-theme \
    libapr1-dev \
    libaprutil1-dev \
    liblog4cxx-dev \
    sbcl \
    python-yaml \
    python-mock \
    python-dev \
    libpython2.7-stdlib \
    python-empy \
    python3-coverage \
    python-rosdep \
    python-nose \
    python-coverage \
    libgpgme-dev \
    libssl-dev \
    python3-lxml \
    python3-pycryptodome \
    python3-gnupg \
    graphviz \
    python-pyqt5.qtwebkit \
    python-numpy \
    python3-pydot \
    python3-pygraphviz \
    python3-netifaces \
    libcurl4-openssl-dev \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
