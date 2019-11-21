#! /bin/bash

MAP_NAME='level'
TAG='latest'
if [ "$1" == "defektive" ]; then
  TAG='defektive'
fi

docker run \
  -v `pwd`/data/worlds/$MAP_NAME:/tmp/world \
  -v `pwd`/data/html:/tmp/out/ \
  --rm \
  -it \
  defektive/mcpe-viz:defektive build/mcpe_viz --db /tmp/world/ --out /tmp/out/$MAP_NAME --html-all
