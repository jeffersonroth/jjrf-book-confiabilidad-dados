docker run --rm -v $(pwd):/data -u $(id -u):$(id -g) -it hrektts/mdbook mdbook init
docker run --rm -v $(pwd):/data -u $(id -u):$(id -g) -it hrektts/mdbook mdbook build
docker run --rm -p 3000:3000 -p 3001:3001 -v $(pwd):/data -u $(id -u):$(id -g) -it hrektts/mdbook mdbook serve -p 3000 -n 0.0.0.0