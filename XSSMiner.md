### Big Domain:
```
apple.com
apnic.net
sas.com
nuveen.com
```

### Configuration:
| Miner  | Name  | Status         |
| ------ | ----- | -------------- |
| Miner1 | alpha | Not Configured |
| Miner2 | beta  | Configured     |
| Miner3 | gamma | Not Configured |
| Miner4 | delta | Configured     |
| Miner5 | Eps   | Configured     |
| Miner6 | Zeta  | Configured     |


### Unzip xssHunter result:
```
for zip in *.zip; do
    base="${zip%.zip}"
    unzip -p "$zip" reflector_xss.txt > "${base}_URxss.txt" 2>/dev/null
    unzip -p "$zip" reflected.txt > "${base}_reflected.txt" 2>/dev/null
done
```
```
for zip in *.zip; do
    base="${zip%.zip}"
    unzip -p "$zip" xss.txt > "${base}_xss.txt" 2>/dev/null
    unzip -p "$zip" pxss.txt > "${base}_pxss.txt" 2>/dev/null
done
```

### Check all xssMiner.zip File size:
```
find . -name "xssMiner.zip" -exec sh -c '
for f; do
    printf "%-40s %8s\n" "$(basename "$(dirname "$f")")" "$(du -h "$f" | cut -f1)"
done
' sh {} +
```


### Unzip all downloaded SurfaceMapper xssMiner.zip file:
```
find . -mindepth 1 -maxdepth 1 -type d \
  -exec sh -c '
    for d; do
      [ -f "$d/xssMiner.zip" ] && [ ! -d "$d/xssMiner" ] && unzip -o "$d/xssMiner.zip" -d "$d"
    done
  ' sh {} +
```

### Rename all folder using hostname:
```
for d in */; do
  f="$d/endpoints.txt"
  [ -f "$f" ] || continue
  host=$(head -n1 "$f" | cut -d/ -f3)
  mv -- "$d" "$host"
done
```
