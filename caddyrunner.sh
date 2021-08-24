#!bin/bash

docker pull caddy

cd
sudo mkdir caddy_data; cd
mkdir websites; cd

sudo chmod 777 websites
sudo chmod 777 caddy_data

$ echo "hello world" > index.html
$ docker run -d -p 8080:80 \
    --name=caddy-webserver \
    -v /home/james/websites:/usr/share/caddy/index.html \
    -v /home/james/caddy_data:/data \
    caddy
...
$ curl http://localhost/
hello world

