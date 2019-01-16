#! /bin/bash

docker run \
  --name mcpe-viz-http \
  -p 8080:80 \
  -v `pwd`/data/html:/usr/share/nginx/html:ro \
  -d nginx
