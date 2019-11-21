#! /bin/bash

docker run \
  --rm \
  -p 8888:80 \
  -v `pwd`/data/html:/usr/share/nginx/html:ro \
  -d nginx
