#!/bin/bash
eval "xhost +local:"
eval "docker start box3_humble"

eval "docker container exec -it --env="DISPLAY" box3_humble env TERM=xterm-256color /bin/bash"
