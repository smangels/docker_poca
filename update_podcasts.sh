#!/usr/bin/env bash

IMAGE_NAME="smangelsen/poca:latest"
THREADS=$(nproc)
CMD="poca -c /poca_config -t ${THREADS}"

if ! test -d $(pwd)/podcasts; then
	mkdir -p $(pwd)/podcasts
fi

if ! test -d $(pwd)/poca_config; then
	mkdir -p $(pwd)/poca_config
	cp poca.xml	$(pwd)/poca_config/.
fi

docker run -t -i \
	--rm \
	-u $(id -u):$(id -g) \
	-v $(pwd)/podcasts:/podcasts \
	-v $(pwd)/poca_config:/poca_config \
	"${IMAGE_NAME}" \
	$CMD

