#!/bin/bash

# set -e

if [ ! -f "/app/data/whirlpool-cli-config.properties" ]; then
  echo "Initialization required. Please run the following:"
  echo 
  echo "docker run --rm -it -v \$(pwd)/data:/app/data whirlpool-client-cli java -jar /app/target/whirlpool-client-cli-run.jar --init"
  sleep 10 && exit 1
fi

if [ -f "/app/data/samourai_wallet_password.txt" ]; then 
  echo "/app/data/samourai_wallet_password.txt detected"
  passphrase=$(cat /app/data/samourai_wallet_password.txt)
  echo "${passphrase}" | java -jar /app/target/whirlpool-client-cli-run.jar --logging.file=/app/log --listen --authenticate
else
  echo "password file not detected"
  java -jar /app/target/whirlpool-client-cli-run.jar --logging.file=/app/log --listen
fi

tail -f /app/log
