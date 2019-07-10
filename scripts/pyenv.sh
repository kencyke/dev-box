#!/bin/bash -eu

## cf. https://github.com/pyenv/pyenv-installer

if [ -e "${SSH_USER_HOME}/.pyenv/bin/pyenv" ]; then
    exit 0
fi

set -x

curl https://pyenv.run | bash