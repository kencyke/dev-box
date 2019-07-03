#!/bin/bash -eu

dpkg -l git 2>/dev/null | grep '^.i' >/dev/null && exit 0

set -x

apt-get update
apt-get install -y git