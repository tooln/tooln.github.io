```
Email  : bughuntar2@gmail.com
Wrn    : Got Abuse Notice - Oct 18
From   : Oct 08
Banned : Nov 09
SSH    : ssh root@45.80.148.193
```
```
Email  : shoponalombd329@gmail.com
From   : Oct 23
Banned : Nov 08
SSH    : ssh root@185.244.129.19
```
```
Email  : aabbccshopon@gmail.com
From   : Oct 29
Banned : Nov 03
SSH    : ssh root@185.244.129.7
```
```
Email  : gcbd.329@gmail.com
From   : Oct 24
SSH    : ssh root@185.244.129.27
```

### Necessary Tools:
```
apt update && apt upgrade -y && apt install -y \
build-essential pkg-config cmake gcc g++ make \
python3-pip python3-venv \
unzip zip git tar xz-utils p7zip-full \
net-tools dnsutils iputils-ping traceroute whois nmap \
htop iftop iotop neofetch lsof tree \
fail2ban unattended-upgrades \
tmux screen jq socat
```

### Install GO:
```
wget https://go.dev/dl/go1.24.8.linux-amd64.tar.gz -O go.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && \
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
```
```
source ~/.zshrc
```

### Install GO tools:
```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -up
nuclei -ut
```
```
nano $HOME/.gau.toml
URLScan API Key: 01999b97-d6b3-7416-bc27-542e7f3a573d
```
```
echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> /root/.profile
source /root/.profile
```
```
snap install amass
```
```
CGO_ENABLED=0 go install -v github.com/owasp-amass/amass/v5/cmd/amass@main
```

### Upload Entine Folder to VPS:
```
scp -r ~/tools root@45.80.148.192:/root/
```
```
scp -r NTV10_ALL.zip root@45.80.148.193:/root/
```

### Download Files from VPS:
```
scp -r root@45.80.148.192:/root/MWEBSpider_output.zip ~/Downloads/VPS/
```
```
zip -r MWEBSpider_output.zip MWEBSpider/
```

### TMUX all Necessary Commands:
```
for d in Miner*/; do echo "$d: $(find "$d" -mindepth 1 | wc -l) items"; done
```
```
for d in Spider*/; do echo "$d: $(find "$d" -mindepth 1 | wc -l) items"; done
```
```
echo 'set -g mouse on' >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
```
