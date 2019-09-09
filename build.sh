#!/bin/bash
set -e

if [ "$1" = "" ]
then
    echo "./build.sh [version-number]"
    exit 1
fi
export VERSION=$1

DOCKER_HOST=asia.gcr.io
DOCKER_PROJECT=kube-chiku
DOCKER_IMAGE=go-app

# Build docker image
echo "building .."
docker build -t $DOCKER_IMAGE:$VERSION .
echo "tagging .."
docker tag $DOCKER_IMAGE:$VERSION $DOCKER_HOST/$DOCKER_PROJECT/$DOCKER_IMAGE:$VERSION

# Push the image to Private Docker Registry
echo "pushing .."
docker push $DOCKER_HOST/$DOCKER_PROJECT/$DOCKER_IMAGE:$VERSION

# Clean the image
echo "removing .."
docker rm $(docker ps -aq)
docker images | awk '/<none/{print $3}' | xargs docker rmi 