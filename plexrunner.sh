#!bin/bash

# system host prereqs
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip  
sudo pip3 install docker-compose

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

cd; sudo mkdir plex
cd plex
sudo mkdir database; sudo mkdir transcode; sudo mkdir plexmedia
cd;

# Pull/Run container
sudo docker pull linuxserver/plex
# sudo docker run -d --name plex-server -p 8093:32400 -v plex/transcode:/transcode -v plex/database:/config plexinc/pms-docker;

sudo docker rm -f plex

# sudo docker run \
# -d \
# --name plex \
# -p 32400:32400/tcp \
# -p 3005:3005/tcp \
# -p 8324:8324/tcp \
# -p 32469:32469/tcp \
# -p 1900:1900/udp \
# -p 32410:32410/udp \
# -p 32412:32412/udp \
# -p 32413:32413/udp \
# -p 32414:32414/udp \
# -e TZ="America/Toronto" \
# -e ADVERTISE_IP="http://192.168.0.29:32400/" \
# --restart unless-stopped \
# linuxserver/plex


sudo docker run -d \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v /home/james/plex/database:/config \
  -v /home/james/plex/transcode:/transcode \
  -v /home/james/plex/plexmedia:/data \
  -e TZ="America/Toronto" \
  -e ADVERTISE_IP="http://192.168.0.29:32400/" \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex



echo
echo
echo ----------------- Plex URLS---------------------------
echo
echo Local Address: "$mylocalip:32400"
echo
# echo PiHole Admin Password:
# sudo docker exec -it pihole sudo pihole -a -p
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
