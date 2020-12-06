#!/bin/sh
if docker ps | grep rdevenv; then docker stop rdevenv; fi
# docker build  --tag alperceire/rdevenv .
RDEV_HOST=${HOME}/rey
RENV_PATHS_ROOT_HOST=${HOME}/caque/renv
RENV_PATHS_ROOT_CONTAINER=/home/rstudio/renv

docker run --rm -d \
    --name rdevenv \
    -e DISABLE_AUTH=true \
    -e ROOT=TRUE \
    -v "${RENV_PATHS_ROOT_HOST}:${RENV_PATHS_ROOT_CONTAINER}" \
    -v "${RDEV_HOST}:/home/rstudio" \
    -p 127.0.0.1:8787:8787 \
    rocker/rstudio
