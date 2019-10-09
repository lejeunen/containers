#!/usr/bin/env bash

NAME=lejeunen/container1
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
helm upgrade module1 'containers/container1' --set image.tag=${TAG} --tiller-namespace infra
echo
