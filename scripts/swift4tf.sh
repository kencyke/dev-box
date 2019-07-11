#!/bin/bash -eu

## cf. https://github.com/tensorflow/swift/blob/master/Installation.md

swift --version | grep "version" >/dev/null 2>&1 && exit 0

S4TFROOT=/usr/local/s4tf-nightly

set -x

mkdir -p ${S4TFROOT}
curl -fsSL https://storage.googleapis.com/swift-tensorflow-artifacts/nightlies/latest/swift-tensorflow-DEVELOPMENT-ubuntu18.04.tar.gz | tar zx --strip 1 -C ${S4TFROOT}

cat >/etc/profile.d/s4tf.sh <<EOS
export PATH=\${PATH}:${S4TFROOT}/bin
EOS