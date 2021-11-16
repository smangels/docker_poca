#!/usr/bin/env bash

PWD=$(pwd)

function _cleanup {
	rm -rf ${PWD}/poca_config/
}

trap _cleanup EXIT


IMAGE_NAME="smangelsen/poca:latest"
THREADS=$(nproc)
CMD="poca -c /poca_config -t ${THREADS}"

if ! test -d ${PWD}/podcasts; then
	mkdir -p ${PWD}/podcasts
fi

if ! test -d ${PWD}/poca_config; then
	mkdir -p ${PWD}/poca_config
else
	rm -rf ${PWD}/poca_config/*.xml
fi

cp poca.xml	${PWD}/poca_config/.

docker run -t -i \
	--rm \
	-u $(id -u):$(id -g) \
	-v ${PWD}/podcasts:/podcasts \
	-v ${PWD}/poca_config:/poca_config \
	"${IMAGE_NAME}" \
	$CMD
