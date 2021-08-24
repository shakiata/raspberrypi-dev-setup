#!bin/bash


# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

sudo docker pull phpmyadmin

docker run --name myphpadmin -d --link mariadb:db -p 8095:80 phpmyadmin

sudo docker run -d \
  --name=mariadb \
  -e PUID=1000 \
  -e PGID=1000 \
  -e MYSQL_ROOT_PASSWORD=8108453500! \
  -e TZ=America/Toronto \
  -p 8094:3306 \
  --restart unless-stopped \
  ghcr.io/linuxserver/mariadb

echo
echo
echo ----------------- Wordpress URLS---------------------------
echo
echo Local Address: "$mylocalip:8095" or "localhost:8095"
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
