#!bin/bash

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

docker pull caddy

# remove old images
sudo docker rm -f caddy-webserver

cd
sudo mkdir caddy_data; cd
mkdir websites; cd

sudo chmod 777 websites
sudo chmod 777 caddy_data

echo "hello world" > index.html
docker run -d -p 8080:80 --name=caddy-webserver \
    -v /home/james/websites:/index.html \
    -v /home/james/caddy_data:/data \
    caddy

curl http://localhost/8080

echo
echo
echo ----------------- Plex URLS---------------------------
echo
echo Local Address: "$mylocalip:8080" or "localhost:8080"
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
