#!/bin/bash

docker stop deluge-daemon
docker rm deluge-daemon
docker rmi deluge-daemon
