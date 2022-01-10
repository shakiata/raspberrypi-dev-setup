usrdir=$(eval echo ~$USER)


docker run -d \
  --name homer \
  -p 8081:8080 \
  -v /home/$USER/assets/:/www/assets \
  --restart=always \
  b4bz/homer:latest


  echo Finished :8081
