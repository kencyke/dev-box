#!/bin/bash -eu

INSTALL () {
    for arg in "$@"
    do
        if [ $(dpkg-query -W -f='${Status}' $arg 2>/dev/null | grep "ok installed") -eq 0 ]; then
        apt-get install -y --no-install-recommends $arg;
        fi
    done
}

set -x

apt-get update

## vim, gedit, apt-transport-https, curl, tar
INSTALL vim gedit gedit-plugins apt-transport-https curl tar

## cf. https://github.com/tensorflow/swift/blob/master/Installation.md
INSTALL clang libpython-dev libblocksruntime-dev

## cf. https://github.com/apple/swift#linux (except clang & libpython-dev)
INSTALL git cmake ninja-build python uuid-dev libicu-dev icu-devtools libedit-dev libxml2-dev libsqlite3-dev swig libncurses5-dev pkg-config libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync

## cf. https://github.com/pyenv/pyenv/wiki/Common-build-problems (except curl, git, libncursesw5-dev & libsqlite3-dev)
INSTALL make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev wget llvm libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

## cf. https://github.com/docker-library/golang/blob/master/Dockerfile-debian.template (except make)
INSTALL g++ gcc libc6-dev pkg-config