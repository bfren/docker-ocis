#!/bin/sh

IMAGE=`cat VERSION`

docker buildx build \
    --build-arg BF_IMAGE=ocis \
    --build-arg BF_VERSION=${IMAGE} \
    -f Dockerfile \
    -t ocis-dev \
    . \
    && \
    docker run -it ocis-dev bash
