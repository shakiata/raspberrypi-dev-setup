#!bin/bash

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)


docker pull wordpress

docker run --name wordpress -p 8096:80 -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=8108453500! -d wordpress

sudo docker update --restart unless-stopped wordpress


echo
echo
echo ----------------- Wordpress URLS---------------------------
echo
echo Local Address: "$mylocalip:8091" or "localhost:8091"
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
