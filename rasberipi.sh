#!bin/bash

echo Installing rasberypi autoconfig.

echo Installing Jenkins

sudo docker pull mlucken/jenkins-arm

sudo docker run -d --name jenkins-server2 -p 8090:8080 -p 50000:50000 -v /home/jenkins_home:/var/jenkins_home mlucken/jenkins-arm;

sudo docker start jenkins-server2

echo Printing Jenkins password
sudo docker exec -it jenkins-server2 cat /var/jenkins_home/secrets/initialAdminPassword
echo Jenkins unlock password above. Save this You;ll need it for the next step!

#Set Jebkins docker instance to restart automatic on system reboot
sudo docker update --restart unless-stopped jenkins-server2


