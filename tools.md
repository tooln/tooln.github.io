
## Golang Installation:
```
sudo apt install golang-go
go version
echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
echo 'export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"' >> ~/.bashrc
source ~/.bashrc
```

## ZSH Shell Installation:

```
sudo apt update
sudo apt install curl
sudo apt install git
sudo apt install net-tools
sudo apt install zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
nano ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
```

### `~/.zshrc`
```
# Enable command auto-completion
autoload -Uz compinit
compinit

# Correct path to zsh-syntax-highlighting plugin
source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Correct path to zsh-autosuggestions plugin
source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Prompt settings
export PROMPT='%n@%m:%~%# '

# Path settings
export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"

# History settings for zsh-autosuggestions
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS        # Ignore duplicate commands in history
setopt HIST_IGNORE_SPACE       # Ignore commands starting with space
setopt HIST_FIND_NO_DUPS       # Don't list duplicates when searching history
```

## All possible GO tools installation:

```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/LukaSikic/subzy@latest
go install github.com/lc/gau/v2/cmd/gau@latest
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
```
/home/rootless/.gau.toml
URLScan API Key: 5a50b58b-645b-4b06-a00d-ea419f7d293e
```

## Notify
```bash
mkdir $HOME/.config/notify
nano $HOME/.config/notify/provider-config.yaml
```
```bash
discord:
  - id: "nuclearone"
    discord_channel: "nuclearone"
    discord_username: "bot"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/1333195545862344735/_84krXusoNfgjIJmezc33Yu5r2xrtuJBcyDXhbYQvXv5KY2J0YciJXYLaQ5I46KVSPSGa"

  - id: "subspider"
    discord_channel: "subspider"
    discord_username: "bot"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/1333195909932253184/4ErXHY17OV5otYroscq2tQPTMDNf0aHNotAOd4kBySswfIjm3bxrn56q8Qx-u60rYf7ma"

```


## Gnom Shell Extension:
```
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
sudo apt install gnome-shell-extension-prefs
sudo apt install gnome-extensions-app
```

## DALFOX Install
```
git clone https://github.com/hahwul/dalfox.git
cd dalfox
go install
go build
./dalfox -h
sudo cp dalfox /usr/local/bin
dalfox -h
```
