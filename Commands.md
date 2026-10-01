### VPS Reboot Command:
```
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean && sudo journalctl --vacuum-time=3d && sudo reboot
```
```
sudo apt update --fix-missing && sudo apt full-upgrade -y && sudo reboot
```
### Zip/Unzip all folder into each name:
```
for d in */; do 7z a -t7z -mx=9 -m0=lzma2 -mmt=on "${d%/}.7z" "$d"; done
```
```
printf '%s\0' *.7z | xargs -0 -n1 -P8 7z x -y -bd
```

### Merge multiple big files at once
```
LC_ALL=C sort -u -S 24G -T /tmp *.txt -o all
```

### Filter out all non-html urls
```
grep -Eiv '\.(js|css|jpg|jpeg|png|gif|svg|webp|ico|woff|woff2|ttf|eot|mp3|mp4|avi|mov|pdf|zip|rar|7z|tar|gz|json|xml)(\?|$)' urls.txt > all_valid_urls.txt
```

### Find specific dir and run command
```
cd "$(find ~ -type d -name "DPS*" -print -quit)" && ls && tmux new-session -d -s Distributed_Processor_DPS "./run.sh"
```
```
cd "$(find ~ -type d -name "mirror*" -print -quit)" && ls && tmux new-session -d -s xssMirror "go run reflector.go -f reflected.txt -m g00gl3 -c 200 -o xss.txt"
```
```
cd "$(find ~ -type d -name worker* -print -quit)" && ls
```

### Copy Big files to another Location
```
mkdir -p "/media/developer/HDD/Secure Startups LLC"
tar -cf - . | pv | tar -xf - -C "/media/developer/HDD/Secure Startups LLC"
```
