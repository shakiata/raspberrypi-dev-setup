#!bin/bash

usrdir=$(eval echo ~$USER)

# Install Prerequisties
echo Installing Prerequisties..
echo Installing Docker...

echo Installing IProute2...
sudo apt -y install iproute2


# remove old docker image if present
sudo docker rm -f jenkins-server

echo Installing rasberypi autoconfig.
sleep 3
echo Installing Jenkins

cd 

mkdir jenkins_home
chmod 777 $usrdir/jenkins_home


#sudo docker pull mlucken/jenkins-arm
sudo docker pull jenkins/jenkins:lts-jdk11

sudo docker run -d --name jenkins-server -p 8091:8080 -p 50000:50000 -v $usrdir/jenkins_home:/var/jenkins_home  jenkins/jenkins:lts-jdk11;



echo Docker daemon starting...

sleep 10

echo Setting up vaiables...

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
# Create Public IP variable and bind to show default Public IP
mypublicip=$(curl https://ipinfo.io/ip)

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




echo
echo
echo ----------------- Jenkins URLS---------------------------
echo
echo Local Addresses: "localhost:8091" or "$mylocalip:8091" 
echo Public Address: "$mypublicip:8091"
echo
echo Jenkins setup Password:
sudo docker exec -it jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!

# GENERATE SSH KEY: docker exec -it jenkins-server ssh-keygen -t rsa -b 4096 -m PEM

