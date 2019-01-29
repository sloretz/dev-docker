# Development Docker Containers

This repo contains Dockerfiles that are handy for ros and gazebo development.
It requires `nvidia-docker2`.
colcon and vcstool are recommended too.

## Quick-start

Install docker-ce and nvidia-docker2.

Install python dependencies
```
pip3 install pyyaml docker
```

Install rocker and off-your-rocker
```
pip3 install --user git+https://github.com/osrf/rocker.git
pip3 install --user git+https://github.com/sloretz/off-your-rocker.git
```

## Scripts

### ./run.py
Wrapper for `docker build` and `rocker` that runs the given image and passes mount points.

```
# Run ros-crystal image
./run.py ros2-crystal
# Run ros-crystal image plus mount a workspace inside
./run.py ros2-crystal ~/path/to/crystal_workspace
```

## ROS2 images
* ros2-crystal - bionic image with crystal debs installed
* ros2-bionic - images with dependencies needed to build ros2 from source.
