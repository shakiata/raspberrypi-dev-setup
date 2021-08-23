#!bin/bash

# system host prereqs
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose

# Run container
docker-compose up --detach

echo
echo
echo ----------------- Pihole URLS---------------------------
echo
echo Local Addresse: "$mylocalip:8091" 
echo Public Address: "$mypublicip:8091"
echo
echo PiHole Admin Password:
sudo docker exec -it pihole sudo pihole -a -p
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!