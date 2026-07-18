### VPS Reboot Command:
```
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && sudo journalctl --vacuum-time=3d && sudo reboot
```

### Necessary Tools:
```
sudo apt update && sudo apt upgrade -y && sudo apt install -y \
build-essential parallel tmux toilet coreutils zsh wget curl git
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
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/notify/cmd/notify@latest
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

### TMUX Setup:
```
tmux new -s tmp
```
```
echo 'set -g mouse on' >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
```
