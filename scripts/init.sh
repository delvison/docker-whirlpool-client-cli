#!/usr/bin/env bash

if ! docker images | grep -q whirlpool-client-cli; then
  docker compose build
fi

docker run --rm -it \
  -v $(pwd)/data:/app/data \
  whirlpool-client-cli \
  java -jar /app/target/whirlpool-client-cli-run.jar --init
