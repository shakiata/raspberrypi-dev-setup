#!bin/bash

# remove old docker image if present
sudo docker rm -f jenkins-server

echo Installing rasberypi autoconfig.
sleep 3
echo Installing Jenkins

sudo docker pull mlucken/jenkins-arm

sudo docker run -d --name jenkins-server2 -p 8091:8080 -p 50000:50000 mlucken/jenkins-arm;

echo docker daemon starting...

sleep 15

sudo docker start jenkins-server2

#Set Jebkins docker instance to restart automatic on system reboot
sudo docker update --restart unless-stopped jenkins-server

echo
echo
echo ****************************************
echo
echo Jenkins URL: "localhost:8090" or "192.168.0.19:8090"
echo
echo Jenkins setup Password:
sudo docker exec -it jenkins-server2 cat /var/jenkins_home/secrets/initialAdminPassword
echo
echo ****************************************
echo
echo

