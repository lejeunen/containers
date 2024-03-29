#!/usr/bin/env bash

NAME=lejeunen/container2
TAG=$(git log -1 --format=%h)
IMAGE=${NAME}:${TAG}
LATEST=${NAME}:latest

echo ${IMAGE}
echo ${LATEST}

docker build -t ${IMAGE} .
docker tag ${IMAGE} ${LATEST}
docker push ${IMAGE}
docker push ${LATEST}

echo
helm upgrade container2 'containers/container2' --set image.tag=${TAG} --tiller-namespace infra
echo
