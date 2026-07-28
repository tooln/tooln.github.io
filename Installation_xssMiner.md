### VPS Reboot Command:
```
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && sudo journalctl --vacuum-time=3d && sudo reboot
```

### Necessary Tools:
```
sudo apt update && sudo apt upgrade -y && sudo apt install -y \
ripgrep build-essential parallel pkg-config cmake gcc g++ make \
python3 python3-pip python3-venv \
git curl wget \
unzip zip tar xz-utils p7zip-full \
net-tools dnsutils iputils-ping traceroute whois nmap \
htop iftop iotop lsof tree \
fail2ban unattended-upgrades \
tmux screen jq socat moreutils \
toilet bc net-tools \
libcurl4-openssl-dev libssl-dev zlib1g-dev
```
```
sudo hostnamectl set-hostname vps12
sudo sed -i 's/^127\.0\.1\.1.*/127.0.1.1 vps12/' /etc/hosts
sudo sed -i 's/^preserve_hostname:.*/preserve_hostname: true/' /etc/cloud/cloud.cfg
sudo reboot
```
```
curl -fsSL -o zsh.sh https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/scripts/zsh.sh && chmod +x zsh.sh && ./zsh.sh && rm zsh.sh
```
```
nnny 223 1111 n1y
```
```
chsh -s $(which zsh)
```
```
cat <<'EOF' >> ~/.zshrc

# >>> Go environment setup >>>
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# <<< Go environment setup <<<

# >>> Custom cls command >>>
cls() {
    clear
    ls
    tmux ls
}
# <<< Custom cls command <<<
EOF

source ~/.zshrc
```
```
curl -fsSL -o zshenv.txt https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/scripts/zshenv && mv zshenv.txt ~/.zshenv && source ~/.zshenv
```

### Install GO:
```
wget https://go.dev/dl/go1.24.8.linux-amd64.tar.gz -O go.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && \
go version
```

### All Tools:
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
curl -fsSL -o "$HOME/.gau.toml" https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/.gau.toml
echo 'unalias gau 2>/dev/null; alias gau=command\ gau' >> ~/.zshrc
source ~/.zshrc
```
```
mkdir $HOME/.config/notify/
nano $HOME/.config/notify/provider-config.yaml
```

### TMUX Setup:
```
tmux new -t tmp
```
```
echo 'set -g mouse on' >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

### Installation Confirmation:
```
check(){ printf "%-12s" "$1"; eval "$2" >/dev/null 2>&1 && echo "✅ INSTALLED" || echo "❌ MISSING"; }; check go "go version"; check amass "amass -version"; check dalfox "dalfox -V"; check subfinder "$HOME/go/bin/subfinder -version"; check assetfinder "$HOME/go/bin/assetfinder -h"; check httpx "$HOME/go/bin/httpx -version"; check notify "$HOME/go/bin/notify -version"; check gau "$HOME/go/bin/gau --version"; check waybackurls "$HOME/go/bin/waybackurls -h"; check waymore "waymore --version"; check aria2c "aria2c -v"; check rustc "rustc --version"; check cargo "cargo --version"; check x8 "x8 --version"
```
