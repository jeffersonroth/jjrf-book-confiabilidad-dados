#!/usr/bin/env bash
# Builds the book
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
echo "installing mdbook"
cargo install mdbook
echo "init mdbook"
mdbook init --title="Ingenieria y Confiabilidad de Datos"
echo "recovering book.toml from backup"
cp ./book.backup.toml ./book.toml
echo "build mdbook"
mdbook build
echo "build done"
cd book