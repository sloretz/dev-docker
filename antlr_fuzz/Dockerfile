FROM openjdk:8

# Clang repos
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-get update \
 && apt-get install -y \
    software-properties-common \
 && apt-get clean \
 && apt-add-repository "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" \
 && apt-add-repository -s "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main"

# Get apt dependencies
RUN apt-get update \
 && apt-get install -y \
    python3-pip \
    gdb \
    vim \
    clang-6.0 \
    sudo \
 && apt-get clean

# ANTLR
ENV ANTLR_VERSION 4.7.1
ENV CLASSPATH .:/antlr-${ANTLR_VERSION}-complete.jar:$CLASSPATH
ADD http://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar /
RUN chmod +r /antlr-${ANTLR_VERSION}-complete.jar

# Tools for generating stuff from an ANTLR grammar
RUN pip3 install grammarinator

# Copy scripts for generating grammar
COPY generate-tests.bash /scripts/

# Make a user matching my user id
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/
