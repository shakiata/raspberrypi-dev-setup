
sudo docker rm -f ghost


sudo docker run -d --name ghost -e url=https://blog.branconet.com -p 8081:2368 -v /home/james/container-program-files/ghost-blog:/var/lib/ghost/content ghost:alpine

sudo docker exec -it ghost apk update && apk add fail2ban -y
sudo docker update --restart unless-stopped ghost