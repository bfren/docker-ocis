# Docker ownCloud Infinite Scale

![GitHub release (latest by date)](https://img.shields.io/github/v/release/bfren/docker-ocis) ![Docker Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fbfren.dev%2Fdocker%2Fpulls%2Focis) ![Docker Image Size](https://img.shields.io/endpoint?url=https%3A%2F%2Fbfren.dev%2Fdocker%2Fsize%2Focis) ![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/bfren/docker-ocis/dev.yml?branch=main)

[Docker Repository](https://hub.docker.com/r/bfren/ocis) - [bfren ecosystem](https://github.com/bfren/docker)

Comes with [ownCloud Infinite Scale](https://owncloud.dev/ocis/) installed.

## Contents

* [Ports](#ports)
* [Volumes](#volumes)
* [Environment Variables](#environment-variables)
* [Licence / Copyright](#licence)

## Ports

* 9200

## Volumes

| Volume    | Purpose              |
| --------- | -------------------- |
| `/config` | Configuration data.  |
| `/data`   | File / storage data. |

## Environment Variables

| Variable              | Values | Description                                                                                    | Default           |
| --------------------- | ------ | ---------------------------------------------------------------------------------------------- | ----------------- |
| `OCIS_ADMIN_PASSWORD` | string | Will be used as the password for default user 'admin'.                                         | *None* - required |
| `OCIS_DOMAIN`         | string | Set the domain from which oCIS will be accessed (scheme and port will be added automatically). | *None* - required |

## Licence

> [MIT](https://mit.bfren.dev/2022)

## Copyright

> Copyright (c) 2022 [bfren](https://bfren.dev) (unless otherwise stated)
