#!/bin/bash -eu

## https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions

dpkg -l code 2>/dev/null | grep '^.i' >/dev/null && exit 0

set -x

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt-get update
apt-get install code # or code-insiders