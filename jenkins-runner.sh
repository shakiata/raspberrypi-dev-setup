#!bin/bash

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

echo almost there...

sleep 10 

echo Starting Jenkins...
sleep 1
echo Success!

sudo docker start jenkins-server

#Set Jebkins docker instance to restart automatic on system reboot
sudo docker update --restart unless-stopped jenkins-server

echo
echo
echo --------------------------------------------
echo
echo Jenkins URL: "localhost:8090" or "192.168.0.19:8090"
echo
echo Jenkins setup Password:
sudo docker exec -it jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
echo
echo -------------------------------------------------
echo
echo
echo Finished!

