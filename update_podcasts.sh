#!/usr/bin/env bash

IMAGE_NAME="smangelsen/poca:latest"
THREADS=$(nproc)
CMD="poca -c /usr/share/config/poca -t ${THREADS}"

docker run -t -i \
	-v $(pwd)/podcasts:/podcasts \
	-v $(pwd)/poca_config:/usr/share/config/poca \
	"${IMAGE_NAME}" \
	$CMD

