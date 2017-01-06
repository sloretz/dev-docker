FROM sloretz/dev:gz-base

# This is a dockerfile for building gazebo + ignition + sdformat
# It adds a developer user with the same id's as the developer
# The source code for these libraries lives outside the docker container, and is brought
# inside via a docker volume. The libraries can be built and run from inside this container

ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME

