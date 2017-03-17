## #!/usr/bin/env
#!/bin/bash

#############################
# Deluge

docker build -t deluge-daemon deluge/
docker run -dt --name=deluge-daemon \
  -v /media/torrents:/torrents \
  -p 7100:8112 \
  -e PROXY_UNAME=tcbauer516@gmail.com \
  -e PROXY_PASS=cody1995 \
  -e PROXY_TYPE=3 \
  -e PROXY_HNAME=proxy.torguard.org \
  -e PROXY_PORT=1085 \
  deluge-daemon
