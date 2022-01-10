usrdir=$(eval echo ~$USER)


docker run -d \
  -p 8081:8080 \
  -v $usrdir/homer/assets/:/www/assets \
  --restart=always \
  b4bz/homer:latest


  echo Finished :8081