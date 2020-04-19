#!/bin/bash
xhost + 
sudo docker run -it --net=host -e DISPLAY=:0 nnynn/dockpi:latest