#!/bin/sh
sudo docker pull nginx
sudo docker run -d -p 81:81 --name temp nginx
sudo docker exec temp mkdir /etc/nginx/server
sudo docker cp hello_world.c temp:etc/nginx/server
sudo docker cp nginx.conf temp:etc/nginx/nginx.conf
sudo docker exec temp apt-get update
sudo docker exec temp apt-get install -y gcc spawn-fcgi libfcgi-dev
sudo docker exec temp gcc /etc/nginx/server/hello_world.c -o /etc/nginx/server/hello_world.fcgi -lfcgi
sudo docker exec temp spawn-fcgi -p 8080 /etc/nginx/server/hello_world.fcgi
sudo docker exec temp nginx -s reload
echo 
curl http://localhost:81/

