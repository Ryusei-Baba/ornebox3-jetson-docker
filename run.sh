#!/bin/bash

eval "docker container run --network host -it --name box3_humble -e DISPLAY=$DISPLAY -e "color_prompt=yes" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v $PWD/docker_share:/home/host_files --privileged -v /dev/sensors:/dev/sensors masakifujiwara1/box3_humble:1119-tsukuba-run"
