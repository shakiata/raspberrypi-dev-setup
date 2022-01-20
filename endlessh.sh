<<<<<<< HEAD
docker run -d \
  --name=endlessh \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Toronto \
  -e MSDELAY=10000 `#optional` \
  -e MAXLINES=32 `#optional` \
  -e MAXCLIENTS=4096 `#optional` \
  -e LOGFILE=false `#optional` \
  -e BINDFAMILY= `#optional` \
  -p 22:2222 \
  -v /path/to/appdata:/config `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/endlessh
=======
docker container run -d -v /home/james/container-program-files/endlessh:/endlessh --name endlessh -p 22:2222 \
harshavardhanj/endlessh:alpine
sudo docker update --restart unless-stopped endlessh
sudo docker exec -it endlessh apk update && apk add fail2ban -y



echo endlessh running
>>>>>>> f6da0ed47d425737deddba1982a3060084828b83
