#! /bin/bash

sudo docker run -it -e DISPLAY=docker.host.internal:0.0 -v /tmp/X11-unix:/tmp/.X11-unix:ro \
	-v ~/.Xauthority:/root/.Xauthority \
	--ipc="host" \
	--device=/dev/snd:/dev/snd \
	--device=/dev/nvidiactl --device=/dev/nvidia-uvm --device=/dev/nvidia0 \
	-v"C:\\users\\ryan\\Desktop\\GamingDocker":/root/gaming
	--net=host \
	--name="steam_test" \
	steam
