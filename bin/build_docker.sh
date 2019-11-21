#! /bin/bash

if [ "$1" == "defektive" ]; then
  docker build --build-arg 'MCPE_VIZ_URL=https://github.com/defektive/mcpe_viz/archive/master.zip' -t defektive/mcpe-viz:defektive .
else
  docker build -t defektive/mcpe-viz:latest .
fi
