## Basic Command:
```
ZIP=$(find ~ -type f -name 'x8Fuzzer*.zip' -print -quit) && cd "$(dirname "$ZIP")" && rm -rf "$(basename "$ZIP" .zip)" && unzip "$ZIP" && rm "$ZIP" && cd "$(basename "$ZIP" .zip)" && clear && ls
```
```
ZIP=$(find ~ -type f -name 'xssHunter*.zip' -print -quit) && cd "$(dirname "$ZIP")" && rm -rf "$(basename "$ZIP" .zip)" && unzip "$ZIP" && rm "$ZIP" && cd "$(basename "$ZIP" .zip)" && clear && ls
```
```
tmux new -s xssHunter
```

## SUBEnum
```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
snap install amass
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
```

## SUBMiner

#### Aria2c
```
sudo apt install aria2 -y
```

#### Wayback Machine
```
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
sudo apt update && sudo apt install -y pipx && pipx ensurepath && pipx install waymore
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
waymore --version
```
```
nano ~/.config/waymore/config.yml
```

## X8
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

## Dalfox & KXSS
```
sudo snap install dalfox
go install github.com/Emoe/kxss@latest
```
