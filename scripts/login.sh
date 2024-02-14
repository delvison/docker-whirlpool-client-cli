#!/usr/bin/env bash

# info: login to samourai whirlpool

apikey=$(cat data/whirlpool-cli-config.properties | grep apiKey | cut -f2 -d'=')
host="localhost:8899"
if [ -f "data/samourai_wallet_password.txt" ]; then 
  passphrase=$(cat data/samourai_wallet_password.txt)
else
  read -p "samourai wallet passphrase > " -s passphrase
fi

echo "checking ${host}..."
check=$(curl -sk -H "apiKey: ${apikey}" "https://${host}/rest/mix")

if echo "${check}" | grep -q "No wallet opened."; then
  echo "Please wait. Logging in..."
  curl -k -H "Content-Type: application/json" \
    -H "apiVersion: 0.10" \
    -H "apiKey: ${apikey}" \
    -d "{\"seedPassphrase\": \"${passphrase}\"}" \
    "https://${host}/rest/cli/login"
else
  echo "${check}"
fi
