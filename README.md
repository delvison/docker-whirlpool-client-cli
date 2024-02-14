This project is a dockerized version of [whirlpool-client-cli](https://code.samourai.io/whirlpool/whirlpool-client-cli).

For more info, see [docs.samourai.io](https://docs.samourai.io/en/whirlpool).

## Usage

### Initialization

First run needs to initialize the `./data/whirlpool-cli-config.properties` file. This initialization process requires a pairing payload from your Samourai Wallet. Get your pairing payload from the Android Samourai Wallet app, go to 'Settings/Transactions/Experimental'.


With your pairing payload ready, run the following:

```sh
./scripts/init.sh
```

The script will build the docker container and then start and attach to `whirlpool-client-cli` with the `--init` flag. Insert your Samourai Wallet pairing payload when prompted.

Quit after `./data/whirlpool-cli-config.properties` exists.

Start normally from now on with `docker compose up -d`.

### Authentication

You can choose to declare your Samourai Wallet password in plain-text via the file `./data/samourai_wallet_password.txt`.

Alternatively, you can choose to supply your password via an API call after the whirlpool-client-cli has started by running the `./scripts/login.sh` script.
