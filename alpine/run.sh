#!/bin/bash
xhost + 
sudo docker run -it --rm -p 8088:8088 -e DISPLAY=:0 nnynn/dockpi:alpine