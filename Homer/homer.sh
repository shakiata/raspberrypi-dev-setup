usrdir=$(eval echo ~$USER)

docker rm -f homer

docker run -d \
  --name homer \
  -p 8081:8080 \
  -v /home/homer/assets/:/www/assets \
  --restart=always \
  b4bz/homer:latest


cp /home/james/raspberrypi-dev-setup/Homer/config.yml /home/homer/assets/config.yml


  echo Finished :8081
