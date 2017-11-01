FROM ubuntu:16.04

# This is a dockerfile for building gazebo
# The source code for these libraries lives outside the docker container, and is brought
# inside via a docker volume. The libraries can be built and run from inside this container

# Need these to do useful stuff below
RUN apt-get update \
 && apt-get install -y \
      wget \
      lsb-release \
      sudo \
      mercurial \
      vim \
      cmake \
      software-properties-common \
      python3-setuptools \
      build-essential \
      debhelper \
 && apt-get clean

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get update \
 && apt-get install -y \
      mesa-utils \
      cppcheck \
      xsltproc \
      python-psutil \
      python \
      bc \
      netcat-openbsd \
      gnupg2 \
      net-tools \
      locales \
      libfreeimage-dev \
      libprotoc-dev \
      libprotobuf-dev \
      protobuf-compiler \
      freeglut3-dev \
      libcurl4-openssl-dev \
      libtinyxml-dev \
      libtar-dev \
      libtbb-dev \
      libogre-1.9-dev \
      libxml2-dev \
      pkg-config \
      qtbase5-dev \
      libqwt-qt5-dev \
      libltdl-dev \
      libgts-dev \
      libboost-thread-dev \
      libboost-signals-dev \
      libboost-system-dev \
      libboost-filesystem-dev \
      libboost-program-options-dev \
      libboost-regex-dev \
      libboost-iostreams-dev \
      libbullet-dev \
      libsimbody-dev \
      libtinyxml2-dev \
      libavformat-dev \
      libavcodec-dev \
      libgraphviz-dev \
      libswscale-dev \
      libavdevice-dev \
      ruby-ronn \
      libgdal-dev \
      libxml2-utils \
      ruby-dev \
      ruby \
      uuid-dev \
      libavutil-dev \
      libzmq3-dev \
      libczmq-dev \
      libgflags-dev \
      libusb-1.0-0-dev \
      libglew-dev \
      libspnav-dev \
      python3-nose \
      python3-nose-cov \
      python-protobuf \
 && apt-get clean

#nvidia docker
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# stuff for gazebo
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:${LD_LIBRARY_PATH}
EXPOSE 11345

ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME
