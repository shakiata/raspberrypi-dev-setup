#!bin/bash

# Builds Docker image and destroys old one
sudo docker build -t pihole_image .
sudo docker rm -f pihole-server

# Runs Docker image in silent mode and in privilleged mode
sudo docker run -d -it --name pihole-server pihole_image bash

# Install Dependencies inside container
sudo docker exec -it pihole-server apt-get -y install wget
sudo docker exec -it pihole-server apt update
sudo docker exec -it pihole-server apt -y install iproute2
sudo docker exec -it pihole-server apt -y curl -sSL https://install.pi-hole.net | bash


