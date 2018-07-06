FROM devbase-bionic

RUN sudo apt-get update \
 && sudo apt-get install -y \
    dput \
    fakeroot \
    debhelper \
    apt-file \
    python-setuptools \
    python3-setuptools \
    python-all \
    python3-all \
    python-pip \
    python3-pip \
 && sudo apt-file update \
 && sudo apt-get clean

RUN sudo apt-file update \
 && pip install --user --upgrade setuptools stdeb twine \
 && pip3 install --user --upgrade setuptools stdeb twine

RUN git clone https://github.com/ros-infrastructure/ros_release_python.git
