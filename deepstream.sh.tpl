#!/bin/bash

sudo docker run \
    -v $(pwd)/conf:/usr/local/deepstream/conf \
    -v $(pwd)/var:/usr/local/deepstream/var \
    --publish=6020:6020 \
    --publish=6021:6021 \
    --restart=always \
    --detach=true \
    --name deepstream.io \
    deepstreamio/deepstream.io:${deepstream_docker_tag}