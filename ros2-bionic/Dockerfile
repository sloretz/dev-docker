FROM ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
    tzdata \
    locales \
    lsb-release \
    curl \
    gnupg \
    vim \
    software-properties-common \
 && apt-get clean \
 && locale-gen en_US en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


RUN echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list \
  && curl http://repo.ros2.org/repos.key -o /tmp/repos.key \
  && apt-key add /tmp/repos.key \
  && rm /tmp/repos.key

RUN apt-get update \
 && apt-get install -y \
    python3-rosdep \
    git wget \
    build-essential cppcheck cmake libopencv-dev python-empy python3-dev python3-empy python3-nose python3-pip python3-pyparsing python3-setuptools python3-vcstools python3-yaml libtinyxml-dev libeigen3-dev \
    clang-format pydocstyle pyflakes python3-coverage python3-mock python3-pep8 uncrustify \
    libasio-dev libtinyxml2-dev \
    libcurl4-openssl-dev libqt5core5a libqt5gui5 libqt5opengl5 libqt5widgets5 libxaw7-dev libgles2-mesa-dev libglu1-mesa-dev qtbase5-dev \
    libfreetype6-dev libxrandr-dev \
    python-qt-binding python3-pyqt5 python3-sip-dev \
    libxcb-shm0-dev \
    libbullet-dev libsdl2-dev libsdl-image1.2-dev \
    python3-lxml \
    python3-lark-parser \
    liblog4cxx-dev \
    python3-numpy \
    python3-pytest \
    libpoco-dev \
    libopensplice69 \
    libyaml-dev \
    libsqlite3-dev \
    libconsole-bridge-dev \
    libassimp-dev \
    python3-pyqt5.qtsvg \
    tango-icon-theme \
    python3-flake8 \
    libspdlog-dev \
    python3-psutil \
    libxml2-utils \
    libpcl-dev \
    libboost-all-dev \
    python3-pydot \
    python3-pygraphviz \
    libcppunit-dev \
    python3-matplotlib \
    clang-tidy \
    python3-mypy \
    python3-pytest-mock \
 && apt-get clean

RUN rosdep init

RUN pip3 install --system argcomplete \
 && pip3 install --system flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes pytest pytest-cov pytest-runner

COPY settings.bash /opt/sloretz_settings.bash
RUN echo "source /opt/sloretz_settings.bash" >> /etc/bash.bashrc
