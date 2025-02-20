# iot-server-api-load-testing

## First time setup
APT update then install: git, postgresql, build-essential, openssl, libssl-dev, go, rust, and setup for postgres password
```bash
sudo apt update && sudo apt install git golang postgresql build-essential openssl libssl-dev && sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'password';" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && source $HOME/.cargo/env
```

## Rust
```bash
git clone 
