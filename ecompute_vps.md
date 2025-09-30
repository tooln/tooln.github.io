```
ssh root@45.80.148.98
```
```
ssh root@45.80.148.155
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

### Install GO and GO tools:
```
wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz -O go.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && \
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc && source ~/.bashrc && \
go version
```
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

### Upload GDrive Files to VPS:
```
python3 -m venv ~/venv
source ~/venv/bin/activate
pip install gdown
gdown https://drive.google.com/uc?id=1KB6VwVKQapjLdCDzHevPWhfTsX70JSpu
deactivate
rm -rf venv/
```

### Download Files from VPS:
```
scp -r root@45.80.148.98:/root/MWEBSpider_output.zip ~/Downloads/VPS/
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
