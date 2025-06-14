#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./certs/nginx.key \
  -out ./certs/nginx.crt \
  -subj "/C=RU/ST=Perm/L=Perm/O=SITU/OU=devops/CN=localhost/emailAddress=makskryzh@gmail.com"

docker exec -it nginx-ssl nginx -s reload 
