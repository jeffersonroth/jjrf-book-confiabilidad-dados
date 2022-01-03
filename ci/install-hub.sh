#!/usr/bin/env bash
# Installs the `hub` executable into hub/bin
set -ex
curl -LsSf https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-2.14.2.tgz -o hub.tgz
mkdir hub
tar -xzvf hub.tgz --strip=1 -C hub

echo "$PWD/hub/bin" >> $GITHUB_PATH