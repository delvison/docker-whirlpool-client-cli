#!/bin/bash

# set -e

if [ ! -f "/app/data/whirlpool-cli-config.properties" ]; then
  echo "Initialization required!"
  echo 
  java -jar /app/target/whirlpool-client-cli-$VERSION-run.jar --init
fi

if [ ! -f "/run/secrets/wallet_secret" ]; then
  echo "ERROR: wallet password not found."
  exit 1
else
  PP=$(cat /run/secrets/wallet_secret)
  echo $PP | java -jar /app/target/whirlpool-client-cli-$VERSION-run.jar --authenticate --logging.file=/app/log
  tail -f /app/log
fi
