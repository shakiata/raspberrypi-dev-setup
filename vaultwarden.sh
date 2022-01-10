docker pull vaultwarden/server:latest
docker run -d --name vaultwarden -v /home/vw-data/:/data/ -p 8092:80 vaultwarden/server:latest