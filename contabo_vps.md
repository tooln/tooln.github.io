```
ssh root@209.126.3.73
```

### Necessary Tools:
```
apt update && apt upgrade -y && apt install -y \
build-essential pkg-config cmake gcc g++ make \
python3-pip python3-venv \
unzip zip tar xz-utils p7zip-full \
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
go install -v github.com/LukaSikic/subzy@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
```
```
/home/rootless/.gau.toml
URLScan API Key: 5a50b58b-645b-4b06-a00d-ea419f7d293e
```
```
echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> /root/.profile
source /root/.profile
```

### Upload GDrive Files to VPS:
```
python3 -m venv ~/venv
source ~/venv/bin/activate
pip install gdown
gdown https://drive.google.com/uc?id=1KB6VwVKQapjLdCDzHevPWhfTsX70JSpu
deactivate
rm -rf myenv
```

### Download Files from VPS:
```
scp -r root@209.126.3.73:/root/MWAYMiner_VISA ~/Downloads/
```

### TMUX all Necessary Commands:
```
tmux new -s session1
```
```
Ctrl+b d
```
```
tmux attach -t session1
```
```
tmux ls
```
