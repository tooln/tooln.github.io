### Wayback Machine
```
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
sudo apt update && sudo apt install -y pipx && pipx ensurepath && pipx install waymore
waymore --version
```

## SUBEnum
```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
snap install amass
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
```

## SUBMiner
```
sudo apt install aria2
```

### X8
```
apt update
apt install -y curl build-essential pkg-config libssl-dev
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustc --version
cargo --version
```
```
cargo install x8
x8 --version
```
