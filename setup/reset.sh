#!/bin/bash

docker stop deluge-daemon
docker rm deluge-daemon
docker rmi deluge-daemon

docker stop plex-daemon
docker rm plex-daemon
docker rmi plex-daemon
sudo rm -rf ~/plex-config
