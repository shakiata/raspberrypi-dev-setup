#!bin/bash
sudo docker-compose up -d
echo
echo
echo
echo webserver live @ localhost:80

sudo docker exec -it proxymanager apt update && apt install fail2ban -y
sudo docker update --restart unless-stopped proxymanager