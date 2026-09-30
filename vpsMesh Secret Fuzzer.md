# Prepare VENV
```
python3 -m venv venv && source venv/bin/activate && pip install tldextract
```

### Sort same host together:
```
sed -E $'s/\x1B\\[[0-9;]*[[:alpha:]]//g' nuclei.txt | python3 -c 'import sys,tldextract; [(lambda r,l: print(f"{r}\t{l}"))(tldextract.extract(next(x for x in l.split() if x.startswith(("http://","https://")))).top_domain_under_public_suffix,l.rstrip()) for l in sys.stdin]' | sort -t $'\t' -k1,1 | cut -f2- > tmp.txt && mv tmp.txt nuclei.txt
```

### Make nuclei output colorful:
```
awk '{line=$0;match(line,/^\[[^]]+\]/);f=substr(line,RSTART,RLENGTH);sub(/^\[/,"",f);sub(/\]$/,"",f);split(f,p,":");printf "\033[1;35m[%s\033[0m:\033[1;36m%s]\033[0m ",p[1],p[2];line=substr(line,RSTART+RLENGTH+1);match(line,/^\[[^]]+\]/);line=substr(line,RSTART+RLENGTH+1);match(line,/^\[[^]]+\]/);line=substr(line,RSTART+RLENGTH+1);match(line,/^https?:\/\/[^ ]+/);printf "\033[1;33m%s\033[0m ",substr(line,RSTART,RLENGTH);line=substr(line,RSTART+RLENGTH+1);match(line,/^\[[^]]+\]/);printf "\033[32m%s\033[0m ",substr(line,RSTART,RLENGTH);line=substr(line,RSTART+RLENGTH+1);printf "\033[1;95m%s\033[0m\n",line}' nuclei.txt > tmp.txt && mv tmp.txt nuclei.txt
```

### Print the diff
```
grep -Fvx -f old.txt new.txt
```

### Extract only URLs:
```
grep -oE 'https?://[^[:space:]]+' nuclei.txt
```

### Calculate Hosts count in nuclei.txt
```
sed -E $'s/\x1B\\[[0-9;]*[[:alpha:]]//g' nuclei.txt | awk '{for(i=1;i<=NF;i++) if($i ~ /^https?:\/\//){print $i; break}}' | sed -E 's#https?://([^/]+).*#\1#' | python3 -c 'import sys,tldextract; from collections import Counter; c=Counter(tldextract.extract(x.strip()).top_domain_under_public_suffix for x in sys.stdin if x.strip()); print("\n".join(f"{n:6} {d}" for d,n in c.most_common()))'
```

### Resume ./run.sh
```
tmux new-session -d -s vpsMesh_V2secretFuzzer "./run.sh"
```
