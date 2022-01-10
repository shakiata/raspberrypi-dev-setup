docker rm -f vaultwarden
docker pull vaultwarden/server:latest
docker run -d --name vaultwarden -v /home/vw-data/:/data/ -p 8092:80 -p 8443:443 vaultwarden/server:latest