#!/bin/bash -eu

## cf. https://www.ubuntuupdates.org/ppa/google_chrome

dpkg -l google-chrome-stable 2>/dev/null | grep '^.i' >/dev/null && exit 0

set -x

curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

apt-get update
apt-get install google-chrome-stable