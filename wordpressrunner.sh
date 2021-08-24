#!bin/bash

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)


docker pull wordpress

docker run --name wordpress -p 8091:80 -d wordpress


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
