
## Golang Installation:
```
sudo apt install golang-go
go version
echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
echo 'export PATH="$PATH:$GOPATH/bin:/usr/local/go/bin"' >> ~/.bashrc
source ~/.bashrc
```

## All possible GO tools installation:

```
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/LukaSikic/subzy@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/waybackurls@latest
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
