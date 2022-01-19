docker container run -d --name endlessh -p 22:2222 \
harshavardhanj/endlessh:alpine
sudo docker update --restart unless-stopped endlessh
sudo docker exec -it endlessh apk update && apk add fail2ban -y



echo endlessh running