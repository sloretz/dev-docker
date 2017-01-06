# Development Docker Containers

This repo contains docker containers for making it easier to contribute code to the gazebo, sdformat, and ignition projects.

## Docker Images
* gz-base
* gz-dev
### gz-base
This contains an Ubuntu Xenial system with all dependencies required for building gazebo, ignition, and sdformat. The released ignition and sdformat libraries are excluded. They must be built from source in the container.
##### Building
Use the script *./build.bash* to create the docker image.
##### Running
Don't bother

### gz-dev
This image builds off of **gz-base**. It adds a user "developer" with the same user and primary group id as the user who built the container.
#####Building
 As a normal user, build this image with
 *./build.bash*
#####Running
 Run it with
 *./run.bash <path to folder with source code\> <path to folder to save build artifacts\>*
 
 This will start a container with the gz-dev image. The source code directory will be mounted as a read-only volume to /src. The build artifact directory will me mounted as a writable volume to /build.

---
*The bulk of the work came from [scpeters](https://bitbucket.org/scpeters/unix-stuff) gazebo8-docker*