#!/bin/bash

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)


# Kills all Containers
echo /////////////////////
echo Stoping Containers...
echo /////////////////////
docker kill $(docker ps -q)
   
# Pulls images and Runs Containers and updates them
echo /////////////////////
echo Pulling Images...
echo /////////////////////
bash jenkinsrunner.sh
bash glancesrunner.sh

docker scan $(docker images -q)

echo /////////////////////
echo Images Updated... Starting Containers.
echo /////////////////////

#Starts all Containers
sudo docker start portainer_agent
sudo docker start gances-sys-monitor
sudo docker start glances-sys-monitor

echo /////////////////////
echo Local IPs Bellow:
echo /////////////////////

echo Plex: "$localip:32400"
echo Protainer: "localip:8090"
echo PI: "$localip:8091"
echo Webserver: "$localip"
echo Fileserver: "$localip:8092"

echo UPDATE COMPLETE. Containers Rebuilt.
