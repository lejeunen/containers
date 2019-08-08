#!/usr/bin/env bash

NAME=lejeunen/container
TAG=$(git log -1 --format=%h)
IMAGE=${NAME}:${TAG}
LATEST=${NAME}:latest

echo ${IMAGE}
echo ${LATEST}

docker build -t ${IMAGE} .
docker tag ${IMAGE} ${LATEST}
docker push ${NAME}

echo
helm upgrade container ./service-chart/ --set image.tag=${TAG},image.repository=${NAME}
echo
