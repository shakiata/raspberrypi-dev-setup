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