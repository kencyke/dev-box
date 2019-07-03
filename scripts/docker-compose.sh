#!/bin/bash -eu

## cf. https://docs.docker.com/compose/install/

VERSION=${VERSION:=1.24.0}

docker-compose --version 2>/dev/null | grep "version ${VERSION}," >/dev/null 2>&1 && exit 0

set -x

curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose