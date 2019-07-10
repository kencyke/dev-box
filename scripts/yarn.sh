#!/bin/bash -eu

## cf. https://yarnpkg.com/en/docs/install#debian-stable

dpkg -l yarn 2>/dev/null | grep '^.i' >/dev/null && exit 0

set -x

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update
apt remove cmdtest
apt-get install yarn