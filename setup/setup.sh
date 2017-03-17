## #!/usr/bin/env
#!/bin/bash

#############################
# Deluge

docker build -t deluge-daemon deluge/
docker run -d --name=deluge-daemon \
  -v /media/torrents:/torrents \
  -p 7100:8112 \
  -e PROXY_UNAME=tcbauer516@gmail.com \
  -e PROXY_PASS=cody1995 \
  -e PROXY_TYPE=3 \
  -e PROXY_HNAME=proxy.torguard.org \
  -e PROXY_PORT=1085 \
  deluge-daemon

#############################
# Plex

mkdir ~/plex-config
sudo chown 797:797 -R ~/plex-config
docker build -t plex-daemon plex/
docker run -d --name=plex-daemon \
  --restart=always \
  -v ~/plex-config:/config \
  -v ~/Movies:/media \
  --net=host \
  -p 7101:32400 \
  plex-daemon
