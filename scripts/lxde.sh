#!/bin/bash -eu

dpkg -l lubuntu-core 2>/dev/null | grep '^.i' >/dev/null && exit 0

set -x

apt-get update

apt-get install -y --no-install-recommends \
    lubuntu-core lightdm lxde lxde-common lxsession-logout