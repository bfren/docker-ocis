#!/bin/bash

set -euo pipefail

docker pull bfren/alpine

BASE_IMAGES="alpine debian"
for I in ${BASE_IMAGES} ; do

    echo "${I}"
    BASE_VERSION=`cat ./${I}/VERSION`
    OCIS_VERSION=`cat ./overlay/tmp/OCIS_REVISION`

    DOCKERFILE=$(docker run \
        -v ${PWD}:/ws \
        -e BF_DEBUG=0 \
        bfren/alpine esh \
        "/ws/Dockerfile.esh" \
        BASE_IMAGE=${I} \
        BASE_VERSION=${BASE_VERSION} \
        OCIS_VERSION=${OCIS_VERSION}
    )

    echo "${DOCKERFILE}" > ./${I}/Dockerfile

done

docker system prune -f
echo "Done."
