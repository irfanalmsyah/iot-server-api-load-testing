# iot-server-api-load-testing

## First time setup server api

APT update then install: git, postgresql, build-essential, openssl, libssl-dev, go, rust, and setup for postgres password

```bash
sudo apt update && sudo apt install git golang postgresql build-essential openssl libssl-dev && sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'password';" && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && source $HOME/.cargo/env && sudo service postgresql start
```

## Rust

```bash
git clone https://github.com/irfanalmsyah/iot-server-api && cd iot-server-api && chmod +x run.sh && ./run.sh
```

If the server runs successfully, stop the server. Change the run.sh 6th line to make it echo run datetime, run in the background and redirect all output to output.txt

```bash
sed -i '6s|.*|echo $(date) >> output.txt && nohup ./target/release/iot-server-api >> output.txt 2>&1 &|' run.sh
```

## Go

```bash
git clone https://github.com/irfanalmsyah/iot-server-athaullah && cd iot-server-athaullah && git checkout v2 && chmod +x run.sh && ./run.sh
```

If the server runs successfully, stop the server. Change the run.sh 6th line to make it echo run datetime, run in the background and redirect all output to output.txt

```bash
sed -i '6s|.*|echo $(date) >> output.txt && nohup ./build/server-iot >> output.txt 2>&1 &|' run.sh
```

## k6 Server Setup

APT update then install: git, k6

```bash
sudo apt update && sudo apt install git && sudo gpg -k && sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69 && echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list && sudo apt-get update && sudo apt-get install k6 && git clone https://github.com/irfanalmsyah/iot-server-api-load-testing && cd iot-server-api-load-testing && chmod +x rust.sh && chmod +x go.sh
```

Change the IP in rust.sh and go.sh to the server IP

```bash
nano rust.sh
```

```bash
nano go.sh
```

Generate ssh key and copy public key to clipboard

```bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N "" && cat ~/.ssh/id_rsa.pub
```

Go to the api server and append the public key to the authorized_keys file

```bash
```bash
echo [PUBKEY] >> ~/.ssh/authorized_keys
```

Run the test in the background and redirect all output to output.txt

### Rust

```bash
nohup ./rust.sh >> output.txt 2>&1 &
```

### Go

```bash
nohup ./go.sh >> output.txt 2>&1 &
```
