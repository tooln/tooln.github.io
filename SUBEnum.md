# SUBEnum - Modern Subdomain Enumeration Tool

A powerful subdomain enumeration tool with modern visual design and execution time tracking, combining multiple reconnaissance tools for comprehensive subdomain discovery.

## Features

- 🎨 Modern terminal UI with color-coded output
- ⏱️ Execution time tracking for each tool
- 🔍 Combines multiple enumeration techniques:
  - Subfinder
  - Amass (passive & active)
  - GAU (Wayback Machine)
  - PureDNS bruteforcing
- 📊 Real-time subdomain count reporting
- 📁 Organized output directory structure

## Prerequisites

- Ubuntu 20.04/22.04 LTS
- Go 1.17+ (for tool installations)
- Python 3.8+

## Installation Guide

### 1. System Update & Dependencies

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install toilet
sudo apt install bc
sudo apt install -y git curl wget python3 python3-pip jq libcurl4-openssl-dev libssl-dev zlib1g-dev
```

### 2. Install Go (if not installed)

```bash
wget https://golang.org/dl/go1.20.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### 3. Install Required Tools

#### Subfinder
```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo cp ~/go/bin/subfinder /usr/local/bin/
```

#### Amass
```bash
go install -v github.com/owasp-amass/amass/v5/cmd/amass@main
sudo cp ~/go/bin/amass /usr/local/bin/
```
```
snap install amass
```

#### GAU
```bash
go install github.com/lc/gau/v2/cmd/gau@latest
sudo cp ~/go/bin/gau /usr/local/bin/
```

#### HTTPx
```bash
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo cp ~/go/bin/httpx /usr/local/bin/
```

#### MassDNS and PureDNS
```bash
cd /go/bin
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
sudo make install
```
```
go install github.com/d3mondev/puredns/v2@latest
```

### 4. Install Wordlists

```bash
mkdir ~/wordlists && cd ~/wordlists

# All DNS wordlist
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt -O allDNS.txt

# Download resolvers
wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt
wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers-trusted.txt -O trusted-resolvers.txt
```

### 5. Get SUBEnum Script

```bash
git clone https://github.com/yourusername/SUBEnum.git
cd SUBEnum
chmod +x subenum.sh
```

## Usage

```bash
./subenum.sh
```

When prompted, enter your target domain (e.g., `example.com`)

## Output Structure

The script creates a directory with your target domain name containing:

```
domain.com/
├── subs_subfinder.txt       # Subfinder results
├── subs_amassPassive.txt    # Amass passive results
├── subs_amassActive.txt     # Amass active results
├── subs_gau.txt            # GAU results
├── subdomains.txt          # Combined unique subdomains
├── alive_subdomains.txt    # Verified alive subdomains
├── subs_purednsBrute.txt   # PureDNS bruteforce results
└── alive_subs_purednsBrute.txt # Verified bruteforced subdomains
```

## Sample Output

![SUBEnum Banner](https://github.com/cybersagor/SUBEnum/blob/main/subenum.png?raw=true)

## Troubleshooting

1. **Color display issues**:
   ```bash
   export TERM=xterm-256color
   ```

2. **Tool not found errors**:
   - Ensure Go binaries are in your PATH:
     ```bash
     echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
     source ~/.bashrc
     ```

3. **Permission denied**:
   ```bash
   chmod +x /usr/local/bin/*
   ```

## Recommended System Specifications

- Minimum: 2 CPU cores, 4GB RAM
- Recommended: 4+ CPU cores, 8GB+ RAM (for faster bruteforcing)

## License

MIT License - © 2025 Secure Startups LLC
