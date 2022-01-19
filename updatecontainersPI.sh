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
cd NGINX
cd Proxy
bash runner.sh
cd ..
cd branconet.com
bash runner.sh
cd ..
cd PiHole
bash pirunner.sh
cd ..
cd Homer
sudo bash homer.sh
cd ..
bash glancesrunner.sh
bash endlessh.sh

echo /////////////////////
echo Images Updated... Starting Containers.
echo /////////////////////

#Starts all Containers
docker start $(docker ps -a -q)

echo /////////////////////
echo Local IPs Bellow:
echo /////////////////////

echo UPDATE COMPLETE. Containers Rebuilt.
