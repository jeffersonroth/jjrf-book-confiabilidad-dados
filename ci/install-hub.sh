#!/usr/bin/env bash
# Installs the `hub` executable into hub/bin
set -ex
curl -LsSf https://github.com/github/hub/releases/download/v2.12.8/hub-linux-amd64-2.12.8.tgz -o hub.tgz
mkdir hub
tar -xzvf hub.tgz --strip=1 -C hub
;;
;;
esac

echo "$PWD/hub/bin" >> $GITHUB_PATH