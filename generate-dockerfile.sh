#!/bin/bash

set -euo pipefail

docker pull bfren/alpine


BASE_IMAGE="alpine"
BASE_VERSION="3.17-4.4.0"
OCIS_VERSION=`cat ./overlay/tmp/OCIS_REVISION`

DOCKERFILE=$(docker run \
    -v ${PWD}:/ws \
    -e BF_DEBUG=0 \
    bfren/alpine esh \
    "/ws/Dockerfile.esh" \
    BASE_IMAGE=${BASE_IMAGE} \
    BASE_VERSION=${BASE_VERSION} \
    OCIS_VERSION=${OCIS_VERSION}
)

echo "${DOCKERFILE}" > ./Dockerfile

docker system prune -f
echo "Done."