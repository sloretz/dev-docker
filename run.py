#!/usr/bin/env python3

import argparse
import os
import sys


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('image', metavar='IMAGE', type=str,
                        help='Name of an image or a path to a folder containing a Dockerfile')
    parser.add_argument('mounts', metavar='PATH', type=str,
                        nargs='*', help='Paths to mount in the container')
    parser.add_argument('--no-cache', action='store_true',
                        help='Ignore cache when building Docker images')
    args = parser.parse_args()

    if os.path.isdir(args.image):
        # If the image is a path, then try building a docker image there

        image_name = os.path.basename(args.image)
        if '' == image_name:
            image_name = image_name = os.path.basename(args.image[:-1])

        docker_cmd = ['docker', 'build', '--force-rm']
        docker_cmd += ['-t', image_name]
        if args.no_cache:
            docker_cmd.append('--no-cache')
        docker_cmd.append(args.image)
        exit_code = os.spawnvp(os.P_WAIT, 'docker', docker_cmd)
        if 0 != exit_code:
            sys.stderr.write('Failed to build docker image\n')
            sys.exit(exit_code)
    else:
        # Not a path? Must be an image from docker hub
        image_name = args.image

    # build command for rocker 
    rocker_cmd = ['rocker', '--nvidia', '--user']
    rocker_cmd += ['--oyr-colcon', '--oyr-spacenav']
    if args.mounts:
        rocker_cmd.append('--oyr-mount')
        rocker_cmd += args.mounts
        rocker_cmd.append('--')
    if args.no_cache:
        rocker_cmd.append('--nocache')
    rocker_cmd.append(image_name)

    # Replace current process with rocker
    os.execvp('rocker', rocker_cmd)