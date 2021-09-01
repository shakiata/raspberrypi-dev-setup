#!bin/bash

sudo docker rm -f fileserver

docker pull filebrowser/filebrowser

sudo docker run -d \
    -v /media/james/pi-ssd/share_files:/srv \
    -v /media/james/pi-ssd/container-program-files/fileserver/database.db:/database.db \
    -v /media/james/pi-ssd/container-program-files/fileserver/filebrowser.json:/filebrowser.json \
    --name fileserver \
    --user $(id -u):$(id -g) \
    -p 8092:80 \
    filebrowser/filebrowser

sudo docker update --restart unless-stopped fileserver