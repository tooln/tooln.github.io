### VPS Reboot Command:
```
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && sudo journalctl --vacuum-time=3d && sudo reboot
```

### Necessary Tools:
```
sudo apt update && sudo apt upgrade -y && sudo apt install -y ripgrep build-essential parallel aria2 pkg-config cmake gcc g++ make python3 python3-pip python3-venv git curl wget unzip zip 7zip tar xz-utils p7zip-full net-tools dnsutils iputils-ping traceroute whois nmap htop iftop iotop lsof tree fail2ban unattended-upgrades tmux screen jq socat moreutils toilet lolcat bc libcurl4-openssl-dev libssl-dev zlib1g-dev
```

### Install zsh
```
curl -fsSL -o zsh.sh https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/scripts/zsh.sh && chmod +x zsh.sh && ./zsh.sh && source ~/.zshrc
```
```
curl -fsSL -o p10k.zsh https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/scripts/p10k.zsh && cp p10k.zsh ~/.p10k.zsh && rm -f p10k.zsh && export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true && source ~/.p10k.zsh && exec zsh -l
```

### Install GO:
```
wget https://go.dev/dl/go1.24.8.linux-amd64.tar.gz -O go.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && source ~/.zshrc && go version && rm -f go.tar.gz && rm -f zsh.sh
```

### All Tools:
```
snap install amass
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/Emoe/kxss@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
sudo apt update && sudo apt install -y pipx && pipx ensurepath && pipx install waymore && waymore --version
curl -fsSL -o zshenv.txt https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/scripts/zshenv && mv zshenv.txt ~/.zshenv && source ~/.zshenv
curl -fsSL -o "$HOME/.gau.toml" https://raw.githubusercontent.com/tooln/tooln.github.io/refs/heads/main/scripts/.gau.toml
```

### Insatll Notify from /vps repo
```
mkdir -p "$HOME/.config/notify" && curl -L "https://drive.google.com/uc?export=download&id=1P-lmMfHwxunTHJNmO9_zei5Ml4-5ss1" -o "$HOME/.config/notify/provider-config.yaml"
```

### TMUX Setup:
```
grep -qxF 'set -g mouse on' ~/.tmux.conf 2>/dev/null || echo 'set -g mouse on' >> ~/.tmux.conf && tmux source-file ~/.tmux.conf
```

### Installation Confirmation:
```
check(){ printf "%-12s" "$1"; eval "$2" >/dev/null 2>&1 && echo "✅ INSTALLED" || echo "❌ MISSING"; }; check go "go version"; check amass "amass -version"; check subfinder "$HOME/go/bin/subfinder -version"; check assetfinder "$HOME/go/bin/assetfinder -h"; check httpx "$HOME/go/bin/httpx -version"; check notify "$HOME/go/bin/notify -version"; check gau "$HOME/go/bin/gau --version"; check waybackurls "$HOME/go/bin/waybackurls -h"; check waymore "waymore --version"; check aria2c "aria2c -v"
```

### Change Hostname manually:
```
sudo hostnamectl set-hostname vps12
sudo sed -i 's/^127\.0\.1\.1.*/127.0.1.1 vps12/' /etc/hosts
sudo sed -i 's/^preserve_hostname:.*/preserve_hostname: true/' /etc/cloud/cloud.cfg
sudo reboot
```
```
echo 'root:gQcEd6KSweNQ3wy49QXdzQikY7ZfP' | chpasswd
```
