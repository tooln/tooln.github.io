## Installation Guide

### 1. System Update & Dependencies

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y toilet bc git curl wget python3 python3-pip jq libcurl4-openssl-dev libssl-dev zlib1g-dev
```

### 2. Install Go (if not installed)

```bash
wget https://golang.org/dl/go1.20.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### 3. Install Required Tools

#### Subfinder + GAU + Waybackurls + HTTPx
```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
```

#### Sublist3r
```
sudo apt install sublist3r -y
```

#### Amass
```
snap install amass
```
