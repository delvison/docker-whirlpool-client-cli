dockerized [whirlpool-client-cli](https://code.samourai.io/whirlpool/whirlpool-client-cli).

## Usage

### Initialization

First run needs to initialize the `./data/whirlpool-cli-config.properties` file.
Run the following:

( Get your pairing payload in Samourai Wallet, go to 'Settings/Transactions/Experimental'")

```sh
docker build -t whirlpool-client-cli ./src/

docker run --rm -it -v $(pwd)/data:/app/data whirlpool-client-cli java -jar /app/target/whirlpool-client-cli-0.10.16-run.jar --init
```

Quit after `./data/whirlpool-cli-config.properties` exists.

Add wallet password to `./wallet_secret.txt`.

Start normally from now on with `docker compose up -d`.
