#!/usr/bin/env bash
# Builds the release and creates an archive and optionally deploys to GitHub.
set -ex

if [[ -z "$GITHUB_REF" ]]
then
  echo "GITHUB_REF must be set"
  exit 1
fi
# Strip mdbook-refs/tags/ from the start of the ref.
TAG=${GITHUB_REF#*/tags/}

host=$(rustc -Vv | grep ^host: | sed -e "s/host: //g")
export CARGO_PROFILE_RELEASE_LTO=true
cargo build --bin mdbook --release
cd target/release
asset="mdbook-$TAG-$host.tar.gz"
tar czf ../../$asset mdbook
esac
cd ../..

if [[ -z "$GITHUB_TOKEN" ]]
then
  echo "$GITHUB_TOKEN not set, skipping deploy."
else
  hub release edit -m "" --attach $asset $TAG
fi