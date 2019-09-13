#!/usr/bin/env bash

NAME=lejeunen/container1
TAG='t'$(date +%Y%m%d%H%M%S)
IMAGE=${NAME}:${TAG}
LATEST=${NAME}:latest

echo ${IMAGE}
echo ${LATEST}

docker build -t ${IMAGE} .
docker tag ${IMAGE} ${LATEST}
docker push ${IMAGE}
docker push ${LATEST}

echo
helm upgrade container1 ../system/container1/ --set image.tag=${TAG},image.repository=${NAME} --tiller-namespace infra
echo
