# Docker ownCloud Infinite Scale

![GitHub release (latest by date)](https://img.shields.io/github/v/release/bfren/docker-ocis) ![Docker Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fbfren.dev%2Fdocker%2Fpulls%2Fsend) ![Docker Image Size](https://img.shields.io/endpoint?url=https%3A%2F%2Fbfren.dev%2Fdocker%2Fsize%2Fsend)<br/>
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/bfren/docker-ocis/dev?label=build)

[Docker Repository](https://hub.docker.com/r/bfren/ocis) - [bfren ecosystem](https://github.com/bfren/docker)

Comes with [ownCloud Infinite Scale](https://owncloud.dev/ocis/) installed.

## Contents

* [Ports](#ports)
* [Volumes](#volumes)
* [Environment Variables](#environment-variables)
* [Licence / Copyright](#licence)

## Ports

* 3000

## Volumes

| Volume    | Purpose                                    |
| --------- | ------------------------------------------ |
| `/config` | Persistent storage for configuration data. |

## Environment Variables

| Variable              | Values | Description                                            | Default           |
| --------------------- | ------ | ------------------------------------------------------ | ----------------- |
| `OCIS_DOMAIN`         | string | Set the base URI from which Send will be accessed.     | *None* - required |
| `OCIS_ADMIN_PASSWORD` | string | Will be used as the password for default user 'admin'. | *None* - required |

## Licence

> [MIT](https://mit.bfren.dev/2022)

## Copyright

> Copyright (c) 2022 [bfren](https://bfren.dev) (unless otherwise stated)
