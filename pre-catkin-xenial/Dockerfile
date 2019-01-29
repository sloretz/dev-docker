FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y \
    gdb \
    build-essential \
    vim \
    python-pip \
 && apt-get clean
 
RUN pip install --upgrade --system setuptools argparse catkin-pkg empy mock nose
