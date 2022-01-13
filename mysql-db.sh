#!bin/bash


# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

sudo docker pull linuxserver/mariadb

sudo docker run -d \
  --name=mariadb \
  -e PUID=1000 \
  -e PGID=1000 \
  -e MYSQL_ROOT_PASSWORD=passhere! \
  -e TZ=America/Toronto \
  -p 8094:3306 \
  -v /home/james/container-program-files/mariadb:/var/lib/mysql \
  ghcr.io/linuxserver/mariadb

echo
echo
echo ----------------- Wordpress URLS---------------------------
echo
echo Local Address: "<mylocalip>:8094" or "localhost:8094"
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
