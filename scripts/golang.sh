#!/bin/bash -eu

VERSION=${VERSION:=1.12.7}
GOROOT=/usr/local/go${VERSION}

type go >/dev/null 2>&1 \
    && go version | grep "version go${VERSION} " >/dev/null 2>&1 \
    && exit 0

set -x

mkdir -p ${GOROOT}
curl -fsSL https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz | tar zx --strip 1 -C ${GOROOT}

cat >/etc/profile.d/golang.sh <<EOS
export GOROOT=${GOROOT}
export PATH=\${PATH}:\${GOROOT}/bin
EOS

grep "export GOPATH=" ~/.bashrc >/dev/null 2>&1 || cat >>$(eval echo ~${SSH_USER})/.bashrc <<EOS
export GOPATH=\${HOME}/go
export PATH=\${PATH}:\${GOPATH}/bin
EOS