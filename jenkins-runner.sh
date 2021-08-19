#!bin/bash

# Install Prerequisties
echo Installing Prerequisties..
echo Installing Docker...
sudo apt install docker

echo Installing IProute2...
sudo apt -y install iproute2


# remove old docker image if present
sudo docker rm -f jenkins-server

echo Installing rasberypi autoconfig.
sleep 3
echo Installing Jenkins

sudo docker pull mlucken/jenkins-arm

sudo docker run -d --name jenkins-server -p 8091:8080 -p 50000:50000 mlucken/jenkins-arm;

echo Docker daemon starting...

sleep 10

echo Jenkins server starting...

sleep 10

echo Running first time setup...

sleep 10 

echo Almost there...

sleep 10 

echo Starting Jenkins...
sleep 1
echo Success!

sudo docker start jenkins-server

#Set Jebkins docker instance to restart automatic on system reboot
sudo docker update --restart unless-stopped jenkins-server

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
# Create Public IP variable and bind to show default Public IP
mypublicip=$(curl https://ipinfo.io/ip)



echo
echo
echo ----------------- Jenkins URLS---------------------------
echo
echo Local Addresses: "localhost:8090" or "$mylocalip:8090" 
echo Public Address: "$mypublicip:8090" (requires port fwd on router) 
echo
echo Jenkins setup Password:
sudo docker exec -it jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!

