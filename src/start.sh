#!/bin/bash

# set -e

if [ ! -f "/app/data/whirlpool-cli-config.properties" ]; then
  echo "Initialization required. Please run the following:"
  echo 
  echo "docker run --rm -it -v \$(pwd)/data:/app/data whirlpool-client-cli java -jar /app/target/whirlpool-client-cli-0.10.16-run.jar --init"
  sleep 10 && exit 1
fi

PP=$(cat /run/secrets/wallet_secret)
echo $PP | java -jar /app/target/whirlpool-client-cli-*-run.jar --authenticate --logging.file=/app/log
tail -f /app/log
