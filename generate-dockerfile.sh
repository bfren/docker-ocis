#!/bin/bash

set -euo pipefail

docker pull bfren/alpine

BASE_VERSION="1.1.4"

DOCKERFILE=$(docker run \
    -v ${PWD}:/ws \
    -e BF_DEBUG=0 \
    bfren/alpine esh \
    "/ws/Dockerfile.esh" \
    BASE_VERSION=${BASE_VERSION}
)

echo "${DOCKERFILE}" > ./Dockerfile

docker system prune -f
echo "Done."
