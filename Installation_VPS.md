### Necessary Tools:
```
apt update && apt upgrade -y && apt install -y build-essential pkg-config cmake gcc g++ make python3-pip python3-venv unzip zip git tar xz-utils p7zip-full net-tools dnsutils iputils-ping traceroute whois nmap htop iftop iotop neofetch lsof tree fail2ban unattended-upgrades tmux screen jq socat moreutils
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
go install github.com/tomnomnom/httprobe@latest
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
echo 'set -g mouse on' >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

### Remove SMTP related templates from Nuclei Templates
```
grep -R -l -i -E "smtp|ehlo|helo|mail from|rcpt to|port 25" . | xargs rm -f
```

### WEBSpider Commands:
```
for d in Miner*/; do echo "$d: $(find "$d" -mindepth 1 | wc -l) items"; done
```
```
for d in Spider*/; do echo "$d: $(find "$d" -mindepth 1 | wc -l) items"; done
```
```
mkdir -p Database/

for i in {1..9}; do cp ./Spider$i/socialMediaLinks.txt ./Database/spider$i.txt; done
cd Database/
cat spider* | sort -u > SocialMediaLinks.txt
rm spider*

for i in {1..9}; do cp ./Spider$i/Links/domains.txt ./Database/spider$i.txt; done
cd Database/
cat spider* | sort -u > allDomain_Links.txt
rm spider*

for i in {1..9}; do cp ./Spider$i/CSPHeaders/domains.txt ./Database/spider$i.txt; done
cd Database/
cat spider* | sort -u > allDomain_CSP.txt
rm spider*

for i in {1..9}; do cp ./Spider$i/Emails/domains.txt ./Database/spider$i.txt; done
cd Database/
cat spider* | sort -u > allDomain_Emails.txt
rm spider*
```
