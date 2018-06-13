FROM ubuntu:16.04

# This is a dockerfile for building ignition libraries from default branch
# The source code for these libraries lives outside the docker container, and is brought
# inside via a docker volume. The libraries can be built and run from inside this container

RUN apt-get update \
 && apt-get install -y \
  # General stuff for development use
        build-essential \
        cmake \
        wget \
        lsb-release \
        sudo \
        vim \
        gdb \
        valgrind \
        autotools-dev \
        automake \
        libspnav-dev \
  # ign msgs
        libprotobuf-dev \
        libprotoc-dev \
        protobuf-compiler \
  # ign common
        libfreeimage-dev \
        libtinyxml2-dev \
        pkg-config \
        uuid-dev \
        libgts-dev \
        libswscale-dev \
        libavdevice-dev \
        libavformat-dev \
        libavcodec-dev \
  # ign rendering
        libglew-dev \
        libogre-1.9-dev \
  # ign transport
        libzmq3-dev \
  # sdformat
        libtinyxml-dev \
        ruby-dev \
  # Ament
        python3-setuptools \
        python3-nose \
        python3-nose-cov \
        python3-pyparsing \
 && apt-get clean

#nvidia docker
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# Build with same userid as outside container so files are editable without sudo
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME

# Start in root directory
WORKDIR /
