#!/bin/sh

sed 's/\"username\":\s*\".*\"/\"username\": \"'"$PROXY_UNAME"'\"/' /config/core.conf > /config/temp.conf ; mv /config/temp.conf /config/core.conf
sed 's/\"password\":\s*\".*\"/\"password\": \"'"$PROXY_PASS"'\"/' /config/core.conf > /config/temp.conf ; mv /config/temp.conf /config/core.conf
sed 's/\"type\":\s*[0-9]*/\"type\": '"$PROXY_TYPE"'/' /config/core.conf > /config/temp.conf ; mv /config/temp.conf /config/core.conf
sed 's/\"hostname\":\s*\".*\"/\"hostname\": \"'"$PROXY_HNAME"'\"/' /config/core.conf > /config/temp.conf ; mv /config/temp.conf /config/core.conf
sed 's/\"port\":\s*[0-9]*/\"port\": '"$PROXY_PORT"'/' /config/core.conf > /config/temp.conf ; mv /config/temp.conf /config/core.conf
