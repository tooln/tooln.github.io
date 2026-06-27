### Necessary Tools:
```
sudo apt update && sudo apt upgrade -y && sudo apt install -y \
build-essential parallel pkg-config cmake gcc g++ make \
python3 python3-pip python3-venv \
git curl wget \
unzip zip tar xz-utils p7zip-full \
net-tools dnsutils iputils-ping traceroute whois nmap \
htop iftop iotop fastfetch lsof tree \
fail2ban unattended-upgrades \
tmux screen jq socat moreutils \
toilet bc net-tools \
libcurl4-openssl-dev libssl-dev zlib1g-dev
```

## Golang Installation:
```
sudo apt install golang-go
go version
```
```
cat <<'EOF' >> ~/.zshrc

# >>> Go environment setup >>>
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# <<< Go environment setup <<<
EOF

source ~/.zshrc
```

## All possible GO tools installation:

```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/LukaSikic/subzy@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -up
nuclei -ut
```
```
sudo apt remove python3-httpx
```
```
subfinder -h
httpx -h
subzy --help
gau -h
anew -h
nuclei -h
```

## Gnom Shell Extension:
```
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
sudo apt install gnome-shell-extension-prefs
sudo apt install gnome-extensions-app
```

### PC Shutdown Command:
```
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && sudo journalctl --vacuum-time=3d && sudo find /tmp /var/tmp -mindepth 1 -delete && sudo systemctl poweroff -i
```
