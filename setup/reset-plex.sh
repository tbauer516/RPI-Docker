#!/bin/bash

docker stop plex-daemon
docker rm plex-daemon
docker rmi plex-daemon
sudo rm -rf ~/plex-config
