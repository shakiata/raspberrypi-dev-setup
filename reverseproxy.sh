#!bin/bash

# system host prereqs
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip  
sudo pip3 install docker-compose

# Create local IP variable and bind to show default local interface IP
mylocalip=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)


# Pull/Run container
sudo docker pull nginx
# remove old images
sudo docker rm -f nginx

# docker run -d -p 8000:8000 -p 8096:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
docker run --name nginx -v /home/james/websites/nginx.conf:/etc/nginx/nginx.conf -d nginx

sudo docker update --restart unless-stopped nginx

echo
echo
echo ----------------- nginx URLS---------------------------
echo
echo Local Address: "$mylocalip:8096"
echo
echo -------------------------------------------------------------------
echo
echo
echo Finished!
