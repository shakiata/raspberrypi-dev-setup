#!bin/bash

# system host prereqs
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip  
sudo pip3 install docker-compose

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

# sudo mkdir plex
# cd plex
# sudo mkdir database; mkdir transcode
# cd

# Pull/Run container
docker pull plexinc/pms-docker
sudo docker run -d --name plex-server -p 8093:32400 -v plex/transcode:/transcode -v plex/database:/config plexinc/pms-docker;

echo
echo
echo ----------------- Plex URLS---------------------------
echo
echo Local Address: "$mylocalip:8093"
echo
# echo PiHole Admin Password:
# sudo docker exec -it pihole sudo pihole -a -p
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
