#!bin/bash

sudo docker rm -f fileserver

docker pull filebrowser/filebrowser

touch /home/james/container-program-files/fileserver/database.db
touch /home/james/container-program-files/fileserver/filebrowser.json


sudo docker run -d \
    -v /home/james/container-program-files/fileserver_share_files:/srv \
    -v /home/james/container-program-files/fileserver/database.db:/database.db \
    -v /home/james/container-program-files/fileserver/filebrowser.json:/filebrowser.json \
    --name fileserver \
    --user $(id -u):$(id -g) \
    -p 8092:80 \
    filebrowser/filebrowser

sudo docker update --restart unless-stopped fileserver