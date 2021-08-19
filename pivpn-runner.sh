#!bin/bash

docker pull ljishen/pivpn

docker run --name pivpn-server -ti --rm \
     --privileged \
     -p 443:443/udp \
     -v "$HOME"/ovpns:/home/pivpn/ovpns \
     ljishen/pivpn


#  sudo apt-get install openvpn 

#  sudo openvpn --auth-nocache --config client.ovpn
