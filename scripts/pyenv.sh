#!/bin/bash -eu

## cf. https://github.com/pyenv/pyenv#basic-github-checkout

SSH_USER_HOME="/home/${SSH_USER}"
if [ -e "${SSH_USER_HOME}/.pyenv/bin/pyenv" ]; then
    exit 0
fi

set -x

sudo -iu ${SSH_USER} -i git clone https://github.com/pyenv/pyenv.git ${SSH_USER_HOME}/.pyenv

echo "export PYENV_ROOT=${SSH_USER_HOME}/.pyenv" >> ${SSH_USER_HOME}/.bashrc
echo "export PATH=\${PYENV_ROOT}/bin:\${PATH}" >> ${SSH_USER_HOME}/.bashrc
echo "eval \"\$(pyenv init -)\"" >> ${SSH_USER_HOME}/.bashrc