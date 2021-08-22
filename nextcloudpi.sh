#!bin/bash

# Install Prerequisties
echo Installing Prerequisties..
echo Installing Docker...
sudo apt install docker

echo Installing IProute2...
sudo apt -y install iproute2

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
# Create Public IP variable and bind to show default Public IP
mypublicip=$(curl https://ipinfo.io/ip)

# remove old docker image if present
sudo docker rm -f nextcloudpi

sudo docker pull nexcloud

sudo docker run -d -p 4443:4443 -p 8443:443 -p 8092:80 -v ncdata:/data --name nextcloudpi nextcloud $DOMAIN

echo
echo
echo ----------------- Jenkins URLS---------------------------
echo
echo Local Addresses: "localhost:8092" or "$mylocalip:8092" 
echo Public Address: "$mypublicip:8092"
echo
echo Jenkins setup Password:
sudo docker exec -it jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
