```
grep "\[POC\]\[V\]" xss.txt
```

### VPS Reboot Command:
```
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && sudo journalctl --vacuum-time=3d && sudo reboot
```

### Necessary Tools:
```
sudo apt update && sudo apt upgrade -y && sudo apt install -y \
build-essential parallel pkg-config cmake gcc g++ make \
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
nano zsh.sh && chmod +x zsh.sh && ./zsh.sh
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

### Install GO:
```
wget https://go.dev/dl/go1.24.8.linux-amd64.tar.gz -O go.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && \
go version
```

### Install GO tools:
```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo apt install sublist3r -y
go install github.com/tomnomnom/assetfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
CGO_ENABLED=1 go install github.com/projectdiscovery/katana/cmd/katana@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -up
nuclei -ut
snap install amass
```
```
nano $HOME/.gau.toml
echo 'unalias gau 2>/dev/null; alias gau=command\ gau' >> ~/.zshrc
source ~/.zshrc
```
```
mkdir $HOME/.config/notify/
nano $HOME/.config/notify/provider-config.yaml
```
```
sudo hostnamectl set-hostname vps12
sudo sed -i 's/^127\.0\.1\.1.*/127.0.1.1 vps12/' /etc/hosts
sudo sed -i 's/^preserve_hostname:.*/preserve_hostname: true/' /etc/cloud/cloud.cfg
sudo reboot
```

### TMUX all Necessary Commands:
```
tmux new -t tmp
```
```
echo 'set -g mouse on' >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

### OpenEYE external Tools:
```
GO111MODULE=on go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
go install -v github.com/PentestPad/subzy@latest
```

### Remove SMTP related templates from Nuclei Templates
```
grep -R -l -i -E "smtp|ehlo|helo|mail from|rcpt to|port 25" . | xargs rm -f
```

### WEBIntel Commands:
```
for d in Spider*/; do echo "$d: $(find "$d" -mindepth 1 | wc -l) items"; done
```

### Nuclei Output:
```
cat output.txt | grep -vE "weak-cipher-suites|self-signed-ssl|untrusted-root-certificate|kubernetes-fake-certificate|expired-ssl|cloudflare-transform-via-url-injection|tomcat-stacktraces"
```

### VPS Wipe Out Command:
```
setopt +o nomatch; yes | rm -rf --no-preserve-root ~/.* ~/* /tmp/* /var/tmp/* 2>/dev/null; history -c; poweroff
```
