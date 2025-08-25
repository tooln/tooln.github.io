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
```
wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz -O go.tar.gz && \
rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && \
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc && source ~/.bashrc && \
go version
```
```

```
```
echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> /root/.profile
source /root/.profile
```
