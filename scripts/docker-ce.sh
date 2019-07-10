#!/bin/bash -eu

## cf. https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

VERSION=${VERSION:=latest}

set -x

if apt-cache policy | grep "https://download.docker.com/linux/ubuntu $(lsb_release -cs)/stable" >/dev/null; then :; else
    apt-get update
    apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
fi

if [ "latest" = "${VERSION}" ]; then
    apt-get update
    VERSION=$(echo $(apt-cache madison docker-ce | head -n 1 | cut -d '|' -f 2))
fi

dpkg -l docker-ce 2>/dev/null | grep '^.i' | grep " ${VERSION} " >/dev/null && exit 0

apt-get update
apt-get remove docker docker-engine docker.io containerd runc
apt-get install -y docker-ce docker-ce-cli containerd.io

groupadd docker
usermod -aG docker ${SSH_USER}