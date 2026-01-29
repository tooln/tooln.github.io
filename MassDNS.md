# Update system
```
sudo apt update && sudo apt upgrade -y
sudo apt install -y git gcc make libldns-dev screen wget curl
```

# Install
```
cd ~
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
```

# Verify
```
./bin/massdns --help
```

# Download public resolvers
```
mkdir -p ~/massdns/resolvers
cd ~/massdns/resolvers
wget https://public-dns.info/nameservers.txt -O resolvers.txt
wc -l resolvers.txt
```
