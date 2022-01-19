usrdir=$(eval echo ~$USER)
ip=$(ifconfig | grep 'inet 192.168.' | cut -d "t" -f2 | cut -c 2-13)

docker rm -f homer

docker run -d \
  --name homer \
  -p 8089:8080 \
  -v /home/homer/assets/:/www/assets \
  --restart=always \
  b4bz/homer:latest


cp /home/james/raspberrypi-dev-setup/Homer/config.yml /home/homer/assets/config.yml
sudo rm -rfv /home/homer/assets/branconet_assets/
sudo cp -r /home/james/raspberrypi-dev-setup/Homer/branconet_assets /home/homer/assets/branconet_assets/


sudo docker exec -it ws1-branconet.com apt update && apt install fail2ban -y


  echo Finished $ip:8081 or homer.box:8091
