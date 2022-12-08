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
    URL=https://download.owncloud.com/ocis/ocis/stable/2.0.0/ocis-2.0.0-linux && \
    apk add curl && \
    curl -sSL -O ${URL}-${ARCH} --output ocis && \
    curl -sSL -O ${URL}-${ARCH}.sha256 --output ocis.sha256

FROM bfren/alpine-s6:alpine3.17-4.4.0 AS final
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

VOLUME [ "/config", "/data" ]
