#!/usr/bin/env bash

# mdbook init
echo "mdbook init"
docker run -d --rm -v $(pwd):/data -u $(id -u):$(id -g) -it hrektts/mdbook mdbook init

# book.toml from backup
echo "book.toml from backup"
cp ./book.backup.toml ./book.toml

# mdbook build
echo "mdbook build"
docker run -d --rm -v $(pwd):/data -u $(id -u):$(id -g) -it hrektts/mdbook mdbook build

# mdbook serve p 3000
echo "mdbook serve p 3000"
docker run -d --rm -p 3000:3000 -p 3001:3001 -v $(pwd):/data -u $(id -u):$(id -g) -it hrektts/mdbook mdbook serve -p 3000 -n 0.0.0.0