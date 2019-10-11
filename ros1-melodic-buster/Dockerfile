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

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

RUN apt-get update \
 && apt-get install -y \
    binutils \
    xz-utils \
    python3-rosinstall-generator \
    python3-pip \
    python3-vcstool \
    git \
    vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo ".....Patching boost python....." \
 && apt-get update \
 && /bin/sh -c "export DL_DIR=/tmp/deps/boost-python && mkdir -p \$DL_DIR && chmod a+rwx \$DL_DIR" \
 && cd /tmp/deps/boost-python \
 && apt-get download libboost-python1.67-dev \
 && ar x libboost-python1.67-dev*.deb \
 && ls \
 && tar xJf control.tar.xz \
 && sed -i.bak 's/ python-dev,//' control \
 && tar --ignore-failed-read -cvJf control.tar.xz {post,pre}{inst,rm} md5sums control \
 && ar rcs libboost-python1.67-dev_nopython.deb debian-binary control.tar.xz data.tar.xz \
 && apt-get install -y \
    libboost-python1.67.0 \
    libboost1.67-dev python3-dev \
 && dpkg --install libboost-python1.67-dev_nopython.deb \
 && rm -rf /tmp/deps \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo ".....Patching python3-empy....." \
 && apt-get update \
 && /bin/sh -c "export DL_DIR=/tmp/deps/python3-empy && mkdir -p \$DL_DIR && chmod a+rwx \$DL_DIR" \
 && cd /tmp/deps/python3-empy \
 && apt-get download python3-empy \
 && ar x python3-empy*.deb \
 && tar xJf control.tar.xz \
 && sed -i.bak 's/, python:any$//' control \
 && tar --ignore-failed-read -cvJf control.tar.xz {post,pre}{inst,rm} md5sums control \
 && ar rcs python3-empy_nopython.deb debian-binary control.tar.xz data.tar.xz \
 && dpkg --install python3-empy_nopython.deb \
 && rm -rf /tmp/deps \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo ".....Patching pcl....." \
 && apt-get update \
 && /bin/sh -c "export DL_DIR=/tmp/deps/pcl-dev && mkdir -p \$DL_DIR && chmod a+rwx \$DL_DIR" \
 && cd /tmp/deps/pcl-dev \
 && apt-get download libpcl-dev \
 && ar x libpcl-dev*.deb \
 && tar xJf control.tar.xz \
 && sed -i.bak 's/ libboost-all-dev,/ libboost-serialization-dev, libboost-mpi-dev, libboost-filesystem-dev, libboost-date-time-dev, libboost-iostreams-dev, libboost-chrono-dev, libboost-system-dev,/' control \
 && tar --ignore-failed-read -cvJf control.tar.xz {post,pre}{inst,rm} md5sums control \
 && ar rcs libpcl-dev_nopython.deb debian-binary control.tar.xz data.tar.xz \
 && apt-get install -y \
    libboost-serialization-dev \
    libboost-mpi-dev \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    libboost-chrono-dev \
    libboost-system-dev \
    libeigen3-dev \
    libflann-dev \
    libvtk7-dev \
    libqhull-dev \
    libvtk7-qt-dev \
    libopenni-dev \
    libopenni2-dev \
    libpcl-apps1.9 \
    libpcl-common1.9 \
    libpcl-features1.9 \
    libpcl-filters1.9 \
    libpcl-io1.9 \
    libpcl-kdtree1.9 \
    libpcl-keypoints1.9 \
    libpcl-ml1.9 \
    libpcl-octree1.9 \
    libpcl-outofcore1.9 \
    libpcl-people1.9 \
    libpcl-recognition1.9 \
    libpcl-registration1.9 \
    libpcl-sample-consensus1.9 \
    libpcl-search1.9 \
    libpcl-segmentation1.9 \
    libpcl-stereo1.9 \
    libpcl-surface1.9 \
    libpcl-tracking1.9 \
    libpcl-visualization1.9 \
 && dpkg --install libpcl-dev_nopython.deb \
 && rm -rf /tmp/deps \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo ".....Patching gazebo....." \
 && apt-get update \
 && /bin/sh -c "export DL_DIR=/tmp/deps/gazebo9-dev && mkdir -p \$DL_DIR && chmod a+rwx \$DL_DIR" \
 && cd /tmp/deps/gazebo9-dev \
 && apt-get download libgazebo9-dev \
 && ar x libgazebo9-dev*.deb \
 && tar xJf control.tar.xz \
 && sed -i.bak 's/ libboost-all-dev,/ libboost-thread-dev, libboost-system-dev, libboost-filesystem-dev, libboost-program-options-dev, libboost-regex-dev, libboost-iostreams-dev, libboost-date-time-dev,/' control \
 && tar --ignore-failed-read -cvJf control.tar.xz {post,pre}{inst,rm} md5sums control \
 && ar rcs libgazebo9-dev_nopython.deb debian-binary control.tar.xz data.tar.xz \
 && apt-get install -y \
    libgraphviz-dev \
    ttf-dejavu-core \
    libccd-dev \
    libopenal-dev \
    libqwt-qt5-dev \
    libprotoc-dev \
    libfreeimage-dev \
    libprotobuf-dev \
    freeglut3-dev \
    libtar-dev \
    libgts-dev \
    libusb-1.0-0-dev \
    libsdformat6-dev \
    libignition-math4-dev \
    libignition-transport4-dev \
    libignition-msgs-dev \
    libignition-common-dev \
    libignition-fuel-tools1-dev \
    libbullet-dev \
    libsimbody-dev \
    libboost-thread-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-iostreams-dev \
    libboost-date-time-dev \
    libtbb-dev \
    fonts-liberation \
    libogre-1.9-dev \
    libgazebo9 \
    gazebo9-common \
    gazebo9-plugin-base \
 && dpkg --install libgazebo9-dev_nopython.deb \
 && rm -rf /tmp/deps \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY patches /tmp/patches

ENV ROS_PYTHON_VERSION=3

RUN echo ".....Getting melodic sources....." \
 && mkdir -p /tmp/melodic-py3/src \
 && cd /tmp/melodic-py3 \
 && /bin/sh -c "rosinstall_generator desktop_full --rosdistro melodic --deps --upstream-devel > devel-melodic.rosinstall" \
 && vcs import --input devel-melodic.rosinstall src \
 && cd ./src \
 && git clone https://github.com/ros/common_tutorials.git \
 && git clone https://github.com/ros/rosbag_migration_rule.git \
 && git clone https://github.com/ros-controls/urdf_geometry_parser.git \
 && git clone https://github.com/ros-drivers/four_wheel_steering_msgs.git \
 && cd /tmp/melodic-py3 \
 && echo ".....Replacing rosdep keys with python3 equivalents....." \
 && find . -name "package.xml" -exec sed -i 's/d>python</d>python3</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-cairo</d>python3-cairo</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-catkin-pkg</d>python3-catkin-pkg</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-coverage</d>python3-coverage</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-defusedxml</d>python3-defusedxml</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-empy</d>python3-empy</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-gnupg</d>python3-gnupg</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-imaging</d>python3-pil</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-lxml</d>python3-lxml</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-matplotlib</d>python3-matplotlib</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-mock</d>python3-mock</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-netifaces</d>python3-netifaces</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-nose</d>python3-nose</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-numpy</d>python3-numpy</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-opencv</d>python3-opencv</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-opengl</d>python3-opengl</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-paramiko</d>python3-paramiko</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-psutil</d>python3-psutil</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-pydot</d>python3-pydot</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-pygraphviz</d>python3-pygraphviz</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-qt5-bindings</d>python3-qt5-bindings</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-qt5-bindings-gl</d>python3-qt5-bindings-gl</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-qt5-bindings-webkit</d>python3-qt5-bindings-webkit</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-rosdep</d>python3-rosdep</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-rospkg</d>python3-rospkg</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-sip</d>python3-sip</' "{}" ";" \
 && find . -name "package.xml" -exec sed -i 's/d>python-yaml</d>python3-yaml</' "{}" ";" \
 && echo ".....Rewriting shebangs to python3....." \
 && find ./src -not -path "*.git*" -type f -exec sed -i '1 s/^#![ ]*\/usr\/bin\/env python$/#!\/usr\/bin\/env python3/' "{}" ";" \
 && echo ".....Patching packages to build with python 3....." \
 && patch ./src/orocos_kinematics_dynamics/python_orocos_kdl/CMakeLists.txt < /tmp/patches/python_orocos_kdl-CMakeLists.txt.patch \
 && patch ./src/roslisp/env-hooks/99.roslisp.sh < /tmp/patches/roslisp-env-hooks-99.roslisp.sh.patch \
 && cd ./src/catkin \
 && cd /tmp/melodic-py3 \
 && mv ./src/orocos_kinematics_dynamics/orocos_kdl/manifest.xml ./src/orocos_kinematics_dynamics/orocos_kdl/manifest.xml.back \
 && mv ./src/orocos_kinematics_dynamics/python_orocos_kdl/manifest.xml ./src/orocos_kinematics_dynamics/python_orocos_kdl/manifest.xml.back \
 && mv ./src/roslisp/manifest.xml ./src/roslisp/manifest.xml.back

RUN echo ".....Downloading dependencies....." \
 && apt-get update \
 && apt-get install -y \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-signals-dev \
    python3-defusedxml \
    python3-gnupg \
    python3-opengl \
 && apt-get install -y --no-install-recommends \
    libgtk2.0-dev \
 && rosdep install -y --from-paths /tmp/melodic-py3/src --ignore-src --skip-keys="python-wxtools libgazebo9-dev python-crypto boost python3-defusedxml python3-gnupg python3-opengl gtk2" \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo ".....Returning ROS Lisp manifest.xml....." \
 && cd /tmp/melodic-py3 \
 && mv ./src/roslisp/manifest.xml.back ./src/roslisp/manifest.xml

#  RUN echo ".....Building melodic from source....." \
#   && cd /tmp/melodic-py3 \
#   && python3 ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --catkin-make-args all tests

# RUN echo ".....Running tests....." \
#  && cd /tmp/melodic-py3 \
#  && . ./install_isolated/setup.sh \
#  && python3 ./src/catkin/bin/catkin_make_isolated --force-cmake --catkin-make-args run_tests \
#  && python3 ./src/catkin/bin/catkin_test_results

