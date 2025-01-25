
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
sudo apt install zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
nano ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc
```
```
autoload -Uz compinit
compinit
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
export PROMPT='%n@%m:%~%# '
export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"
```

## All possible GO tools installation:

```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/LukaSikic/subzy@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
```
```
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -up
nuclei -ut
```
```
cd go/bin && sudo cp * /usr/local/bin && cd $HOME
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
    discord_webhook_url: "https://discord.com/api/webhooks/1332847031571583068/YWZYExlSukzKrtXnntEDjPORlzP8SYDNUpcqDhqDzY-eP6X1mLT2_1UcjoMbP4RWdJDi"

  - id: "subspider"
    discord_channel: "subspider"
    discord_username: "bot"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/1332847118892924939/46ZlMMQssOYAyZsWS_SZ-pQ24wsgJZyfjtWjp3LKgaKmN-qOxM9DvDahUXoTLixVNcHV"

  - id: "httput"
    discord_channel: "httput"
    discord_username: "bot"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/1332847219438518424/5lpf07KTFCvhbM3DbmC5qMdtTi8RH3wAx0CXTxtAouaW1JP09Ra4NcSx7dns-WuogpGw"

  - id: "templates"
    discord_channel: "templates"
    discord_username: "bot"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/1332847332802428969/h-ePZOVeW8nc1HsOuxEUZ_UzKLkGO6054BQ5Pqqq3XDXIC4zlnp7tAneiwaq2gRNENgq"

  - id: "notes"
    discord_channel: "notes"
    discord_username: "bot"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/1332847524540710973/LPhZBhzPCCaOAwt7HqhWNImwUdkqxoluGlmA_pYQVEKx4oSg7VdCr3FYooobHTN-ehRC"

```
