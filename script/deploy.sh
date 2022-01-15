#!/bin/bash

ssh ubuntu@43.134.166.176 "
  sudo chmod 666 /var/run/docker.sock
  docker login
  docker rm sufu.site.nginx -f
  docker rmi sufuwang/sufu.site
  docker pull sufuwang/sufu.site
  docker run -d -p 80:80 --name sufu.site.nginx sufuwang/sufu.site
"
