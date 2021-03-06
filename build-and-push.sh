#!/usr/bin/env bash
image="commercialtribe/redis-sentinel-sidecar:v20170407.1"

login(){
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
}

push(){
  docker push $image
}

build() {
  docker build -t $image .
}

build && (push || (login && push))
