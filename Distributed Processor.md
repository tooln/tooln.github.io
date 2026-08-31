## Run this command to all vps to zip the processed folder:
```
for d in VPS{1..100}; do [ -d "$d" ] && 7z a -t7z -mx=9 -m0=lzma2 -mmt=on DP.7z "$d"; done
```
```
for d in DPS{1..100}; do [ -d "$d" ] && 7z a -t7z -mx=9 -m0=lzma2 -mmt=on DP.7z "$d"; done
```
```
for d in Worker{1..100}; do [ -d "$d" ] && 7z a -t7z -mx=9 -m0=lzma2 -mmt=on DP.7z "$d"; done
```

## After Download run this command to unzip:
```
7z a -t7z -mx=7 -m0=lzma2 -mmt=on Folder.7z Folder
```
```
printf '%s\0' *.7z | xargs -0 -n1 -P24 7z x -y -bd
```
```
printf '%s\0' *.zip | xargs -0 -n1 -P24 7z x -y -bd
```

#### Change the dir name from VPS{xx}
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
for i in {1..100}; do cp VPS$i/output/VPS$i.txt $i.txt; done
```
```
for i in {1..100}; do rm -rf VPS$i; done
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
```
cd "$(find ~ -type d -name "mirror*" -print -quit)" && ls && tmux new-session -d -s xssMirror "go run reflector.go -f reflected.txt -m g00gl3 -c 200 -o xss.txt"
```

## Extract only URLs:
```
grep -oE 'https?://[^[:space:]]+' vpsMesh_nuclei_result_27.txt
```

## Make nuclei output colorful:
```
awk '
{
  gsub(/\[generic-env-001:exposed-secrets\]/, "\033[1;35m&\033[0m")
  gsub(/\[http\]/, "\033[1;36m&\033[0m")
  gsub(/\[critical\]/, "\033[1;31m&\033[0m")
  gsub(/https?:\/\/[^ ]+/, "\033[1;34m&\033[0m")
  gsub(/DB_[A-Z_]+|VITE_[A-Z_]+|API_URL|OKTA_CLIENT_ID|LAUNCHDARKLY_CLIENT_ID/, "\033[1;33m&\033[0m")
  gsub(/\[paths=[^]]+\]/, "\033[1;32m&\033[0m")
  print
}' vpsMesh_nuclei_result_27.txt > nuclei.txt
```
