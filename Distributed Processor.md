## Run this command to all vps to zip the processed folder:
```
for d in VPS{1..80}; do [ -d "$d" ] && zip -r DP.zip "$d"; done
```
```
for d in DPS{1..80}; do [ -d "$d" ] && zip -r DP.zip "$d"; done
```
```
for d in Worker{1..80}; do [ -d "$d" ] && zip -r DP.zip "$d"; done
```

## After Download run this command to unzip:
```
printf '%s\0' *.zip | xargs -0 -n1 -P16 unzip -q
```

#### Change the dir name VPS
```
find . -maxdepth 1 -type d -name 'VPS[0-9]*' -print0 |
xargs -0 -n1 -P16 bash -c '
    d="$1"
    cd "$d/output" || exit 1

    find . -maxdepth 1 -type f -name "*.txt" -print0 |
        xargs -0 cat |
        sort -u > all

    find . -maxdepth 1 -type f -name "*.txt" -delete

    mv all "$(basename "$d").txt"
' bash
```
```
for i in {1..80}; do cp VPS$i/output/VPS$i.txt $i.txt; done
```
```
for i in {1..80}; do rm -rf VPS$i; done
```
```
cat -- *.txt | sort -u -S 80% -T /tmp > all
```
```
rm *.txt && mv all urls.txt
```

## Filter out all non-html urls
```
grep -Eiv '\.(js|css|jpg|jpeg|png|gif|svg|webp|ico|woff|woff2|ttf|eot|mp3|mp4|avi|mov|pdf|zip|rar|7z|tar|gz|json|xml)(\?|$)' urls.txt > all_valid_urls.txt
```

## Find specific dir and run command
```
cd "$(find ~ -type d -name "DPS*" -print -quit)" && ls && tmux new-session -d -s Distributed_Processor_DPS "./run.sh"
```
