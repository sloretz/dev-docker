FROM ubuntu:20.04

# --- modified from ros image template ---

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    vim \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros-testing/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install all noetic packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-noetic-actionlib-msgs \
    ros-noetic-angles \
    ros-noetic-catkin \
    ros-noetic-class-loader \
    ros-noetic-class-loader-dbgsym \
    ros-noetic-cmake-modules \
    ros-noetic-common-msgs \
    ros-noetic-cpp-common \
    ros-noetic-cpp-common-dbgsym \
    ros-noetic-diagnostic-msgs \
    ros-noetic-eigen-stl-containers \
    ros-noetic-gencpp \
    ros-noetic-geneus \
    ros-noetic-genlisp \
    ros-noetic-genmsg \
    ros-noetic-gennodejs \
    ros-noetic-genpy \
    ros-noetic-geometry-msgs \
    ros-noetic-gl-dependency \
    ros-noetic-media-export \
    ros-noetic-message-filters \
    ros-noetic-message-filters-dbgsym \
    ros-noetic-message-generation \
    ros-noetic-message-runtime \
    ros-noetic-mk \
    ros-noetic-nav-msgs \
    ros-noetic-pluginlib \
    ros-noetic-qwt-dependency \
    ros-noetic-random-numbers \
    ros-noetic-random-numbers-dbgsym \
    ros-noetic-resource-retriever \
    ros-noetic-resource-retriever-dbgsym \
    ros-noetic-ros \
    ros-noetic-ros-comm \
    ros-noetic-ros-environment \
    ros-noetic-ros-tutorials \
    ros-noetic-rosbag \
    ros-noetic-rosbag-dbgsym \
    ros-noetic-rosbag-migration-rule \
    ros-noetic-rosbag-storage \
    ros-noetic-rosbag-storage-dbgsym \
    ros-noetic-rosbash \
    ros-noetic-rosboost-cfg \
    ros-noetic-rosbuild \
    ros-noetic-rosclean \
    ros-noetic-rosconsole \
    ros-noetic-rosconsole-bridge \
    ros-noetic-rosconsole-bridge-dbgsym \
    ros-noetic-rosconsole-dbgsym \
    ros-noetic-roscpp \
    ros-noetic-roscpp-core \
    ros-noetic-roscpp-dbgsym \
    ros-noetic-roscpp-serialization \
    ros-noetic-roscpp-serialization-dbgsym \
    ros-noetic-roscpp-traits \
    ros-noetic-roscpp-tutorials \
    ros-noetic-roscpp-tutorials-dbgsym \
    ros-noetic-roscreate \
    ros-noetic-rosdoc-lite \
    ros-noetic-rosgraph \
    ros-noetic-rosgraph-msgs \
    ros-noetic-roslang \
    ros-noetic-roslaunch \
    ros-noetic-roslib \
    ros-noetic-roslib-dbgsym \
    ros-noetic-roslisp \
    ros-noetic-roslz4 \
    ros-noetic-roslz4-dbgsym \
    ros-noetic-rosmake \
    ros-noetic-rosmaster \
    ros-noetic-rosmsg \
    ros-noetic-rosnode \
    ros-noetic-rosout \
    ros-noetic-rosout-dbgsym \
    ros-noetic-rospack \
    ros-noetic-rospack-dbgsym \
    ros-noetic-rosparam \
    ros-noetic-rospy \
    ros-noetic-rospy-tutorials \
    ros-noetic-rosservice \
    ros-noetic-rostest \
    ros-noetic-rostime \
    ros-noetic-rostime-dbgsym \
    ros-noetic-rostopic \
    ros-noetic-rosunit \
    ros-noetic-roswtf \
    ros-noetic-sensor-msgs \
    ros-noetic-shape-msgs \
    ros-noetic-std-msgs \
    ros-noetic-std-srvs \
    ros-noetic-stereo-msgs \
    ros-noetic-topic-tools \
    ros-noetic-topic-tools-dbgsym \
    ros-noetic-trajectory-msgs \
    ros-noetic-turtlesim \
    ros-noetic-turtlesim-dbgsym \
    ros-noetic-visualization-msgs \
    ros-noetic-webkit-dependency \
    ros-noetic-xmlrpcpp \
    ros-noetic-xmlrpcpp-dbgsym \
  && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_PYTHON_VERSION=3

# bootstrap rosdep
# RUN rosdep init

