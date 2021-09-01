#!bin/bash

docker pull filebrowser/filebrowser

sudo docker run \
    -v /media/james/pi-ssd/share_files:/srv \
    -v /media/james/pi-ssd/container-program-files/fileserver/database.db:/database.db \
    -v /media/james/pi-ssd/container-program-files/fileserver/filebrowser.json:/.filebrowser.json \
    --name fileserver \
    --user $(id -u):$(id -g) \
    -p 8092:80 \
    filebrowser/filebrowser