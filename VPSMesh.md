### ZIP all worker folder into each VPS:
```
for d in worker{1..100}; do [ -d "$d" ] && 7z a -t7z -mx=9 -m0=lzma2 -mmt=on DP.7z "$d"; done
```

### ZIP any folder
```
7z a -t7z -mx=7 -m0=lzma2 -mmt=on Folder.7z Folder
```

### Unzip any folder
```
printf '%s\0' *.7z | xargs -0 -n1 -P24 7z x -y -bd
```

### Merge multiple big files at once
```
cat -- *.txt | sort -u -S 80% -T /tmp > all
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

### Extract only URLs:
```
grep -oE 'https?://[^[:space:]]+' nuclei.txt
```
```
python3 -m venv venv && source venv/bin/activate && pip install tldextract
```
```
sed -E $'s/\x1B\\[[0-9;]*[[:alpha:]]//g' nuclei.txt | awk '{for(i=1;i<=NF;i++) if($i ~ /^https?:\/\//){print $i; break}}' | sed -E 's#https?://([^/]+).*#\1#' | python3 -c 'import sys,tldextract; from collections import Counter; c=Counter(tldextract.extract(x.strip()).top_domain_under_public_suffix for x in sys.stdin if x.strip()); print("\n".join(f"{n:6} {d}" for d,n in c.most_common()))'
```

### Make nuclei output colorful:
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
