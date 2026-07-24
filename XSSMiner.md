## Basic Command:
```
for zip in *.zip; do
    base="${zip%.zip}"
    unzip -p "$zip" xss.txt > "${base}_xss.txt" 2>/dev/null
    unzip -p "$zip" pxss.txt > "${base}_pxss.txt" 2>/dev/null
done
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

# Onliner:
```
snap install amass
snap install dalfox
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/Emoe/kxss@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
sudo apt update && sudo apt install -y pipx && pipx ensurepath && pipx install waymore
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
waymore --version
apt update
sudo apt install aria2 -y
apt install -y curl build-essential pkg-config libssl-dev
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustc --version
cargo --version
cargo install x8
x8 --version
```
```
check(){ printf "%-12s" "$1"; eval "$2" >/dev/null 2>&1 && echo "✅ INSTALLED" || echo "❌ MISSING"; }; check go "go version"; check amass "amass -version"; check dalfox "dalfox -V"; check subfinder "$HOME/go/bin/subfinder -version"; check assetfinder "$HOME/go/bin/assetfinder -h"; check httpx "$HOME/go/bin/httpx -version"; check notify "$HOME/go/bin/notify -version"; check gau "$HOME/go/bin/gau --version"; check waybackurls "$HOME/go/bin/waybackurls -h"; check waymore "waymore --version"; check aria2c "aria2c -v"; check rustc "rustc --version"; check cargo "cargo --version"; check x8 "x8 --version"
```
