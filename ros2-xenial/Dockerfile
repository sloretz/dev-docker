FROM devbase-xenial

RUN export DEBIAN_FRONTEND=noninteractive \
 && sudo apt-get update \
 && sudo -E apt-get install -y \
    tzdata \
    locales \
 && sudo apt-get clean \
 && sudo locale-gen en_US en_US.UTF-8 \
 && sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN sudo apt-get update \
 && sudo apt-get install -y \
    git wget \
    build-essential cppcheck cmake libopencv-dev python-empy python3-dev python3-empy python3-nose python3-pip python3-pyparsing python3-setuptools python-vcstools python3-yaml libtinyxml-dev libeigen3-dev \
    clang-format pydocstyle pyflakes python3-coverage python3-mock python3-pep8 uncrustify \
    libasio-dev libtinyxml2-dev \
    libcurl4-openssl-dev libqt5core5a libqt5gui5 libqt5opengl5 libqt5widgets5 libxaw7-dev libgles2-mesa-dev libglu1-mesa-dev qtbase5-dev \
    libfreetype6-dev libxrandr-dev \
 && sudo apt-get clean

RUN pip3 install --user argcomplete \
 && pip3 install --user flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes pytest pytest-cov pytest-runner \
 && pip3 install --user colcon-common-extensions catkin_pkg

COPY settings.bash .settings.bash
RUN echo "source ~/.settings.bash" >> .bashrc
