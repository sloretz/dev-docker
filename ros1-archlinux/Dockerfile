FROM archlinux/base

RUN pacman -Sy --noconfirm base-devel

# Add a user to build stuff
RUN useradd ros --create-home

# give user passwordless sudo access
RUN echo "ros ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Get yay
RUN pacman -Sy --noconfirm git go \
 && cd /tmp \
 && sudo -u ros git clone https://aur.archlinux.org/yay.git \
 && cd yay \
 && sudo -u ros makepkg -si --noconfirm

# Install ros-melodic-catkin with modifications to use 0.7.19
RUN sudo -u ros yay --useask -S --noconfirm gmock gtest python python-catkin_pkg python-empy python-nose ros-build-tools-py3 cmake \
 && cd /tmp \
 && sudo -u ros git clone https://github.com/ros-melodic-arch/ros-melodic-catkin.git \
 && cd ros-melodic-catkin \
 && sed -i.bak 's/0.7.18/0.7.19/g' .SRCINFO \
 && sed -i.bak 's/0.7.18/0.7.19/g' PKGBUILD \
 && sed -i.bak 's/b6a7428944911a011b0c3b0e465f2db04d219ce5f72cf3e2f76194dd055f1f49/b83d66640df99f72bc37160e8b60a76df6c87ff8dcbb9ab096911c44f08d13e1/' .SRCINFO \
 && sed -i.bak 's/b6a7428944911a011b0c3b0e465f2db04d219ce5f72cf3e2f76194dd055f1f49/b83d66640df99f72bc37160e8b60a76df6c87ff8dcbb9ab096911c44f08d13e1/' PKGBUILD \
 && sudo -u ros makepkg -si --noconfirm

# Try to build realtime tools
RUN sudo -u ros yay --useask -S --noconfirm ros-build-tools-py3 ros-melodic-realtime-tools
