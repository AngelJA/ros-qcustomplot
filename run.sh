#! /usr/bin/env bash
IMAGE_NAME=ros-qcustomplot-img
CONTAINER_NAME=ros-qcustomplot-container

docker build -t $IMAGE_NAME .
xhost +
docker run -ti --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY --name $CONTAINER_NAME --privileged --net host $IMAGE_NAME
xhost -