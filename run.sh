#!/bin/sh
if docker ps | grep rdevenv; then docker stop rdevenv; fi
docker build  --tag alperceire/rdevenv .
RDEV_HOST_HOME=${HOME}/caque
RDEV_CONT_HOME=/home/rstudio
RDEV_HOST_GIT=${HOME}/rey
RDEV_CONT_GIT=${RDEV_CONT_HOME}/rey

docker run --rm -d \
    --name rdevenv \
    -e DISABLE_AUTH=true \
    -e ROOT=TRUE \
    -v "${RDEV_HOST_HOME}:${RDEV_CONT_HOME}" \
    -v "${RDEV_HOST_GIT}:${RDEV_CONT_GIT}" \
    -p 127.0.0.1:8787:8787 \
    alperceire/rdevenv
