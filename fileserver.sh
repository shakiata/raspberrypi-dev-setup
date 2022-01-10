#!bin/bash

sudo docker rm -f fileserver

docker pull filebrowser/filebrowser

sudo docker run -d \
    -v /home/container-program-files/fileserver_share_files:/srv \
    -v /home/container-program-files/fileserver:/database.db \
    -v /home/container-program-files/fileserver:/filebrowser.json \
    --name fileserver \
    --user $(id -u):$(id -g) \
    -p 8092:80 \
    filebrowser/filebrowser

sudo docker update --restart unless-stopped fileserver