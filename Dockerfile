FROM --platform=${BUILDPLATFORM} golang:alpine AS build

ARG TARGETPLATFORM
ARG BUILDPLATFORM

WORKDIR /tmp

RUN case "${TARGETPLATFORM}" in \
        linux/amd64) ARCH="amd64" ;; \
        linux/arm/v7) ARCH="arm" ;; \
        linux/arm64) ARCH="arm64" ;; \
        *) echo "Unsupported target platform: ${TARGETPLATFORM}." && exit 1 ;; \
    esac && \
    echo "${ARCH}" > arch && \
    echo "Build: ${BUILDPLATFORM}" > /log && \
    echo "Target: ${TARGETPLATFORM}" >> /log && \
    echo "Arch: ${ARCH}" >> /log && \
    echo "oCIS: 2.0.0" >> /log && \
    FILE=ocis-2.0.0-linux-${ARCH} && \
    URL=https://download.owncloud.com/ocis/ocis/stable/2.0.0/ && \
    apk add curl && \
    curl -sSL -O ${URL}/${FILE} && \
    curl -sSL -O ${URL}/${FILE}.sha256 && \
    sha256sum -cs ${FILE}.sha256 && \
    mv ${FILE} ./ocis

FROM bfren/debian-s6:debian11-1.1.4 AS final
COPY --from=build /log /log
COPY --from=build /tmp /tmp

LABEL org.opencontainers.image.source="https://github.com/bfren/docker-ocis"

ARG BF_IMAGE
ARG BF_VERSION

EXPOSE 9200

ENV \
    # the external domain of your oCIS server
    OCIS_DOMAIN= \
    # password for default admin account
    OCIS_ADMIN_PASSWORD=

COPY ./overlay /

RUN bf-install

VOLUME [ "/config", "/data" ]
