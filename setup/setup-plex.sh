## #!/usr/bin/env
#!/bin/bash

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
