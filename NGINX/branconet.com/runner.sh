#!bin/bash



sudo docker-compose up -d
sudo rm -rfv /home/james/container-program-files/branconet.com
cd /home/james/container-program-files/ && git clone https://github.com/jtmb/branconet.com.git

sudo docker restart ws1-branconet.com

cd 
echo
echo
echo
echo webserver live @ localhost:8092