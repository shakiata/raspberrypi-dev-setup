docker pull vaultwarden/server:latest
docker run -d --name vaultwarden -e SIGNUPS_ALLOWED=false -v /home/james/container-program-files/vault_warden:/data/ -p 8096:80 vaultwarden/server:latest
sudo docker update --restart unless-stopped vaultwarden
sudo docker exec -it vaultwarden apt update && apt install fail2ban -y

echo finished! :8096