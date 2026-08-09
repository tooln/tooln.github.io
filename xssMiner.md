## Server List:
| Miner  | Name  | Status         |
| ------ | ----- | -------------- |
| Miner1 | alpha | Configured     |
| Miner2 | beta  | Configured     |
| Miner3 | gamma | Configured     |
| Miner4 | delta | Configured     |
| Miner5 | Eps   | Configured     |
| Miner6 | Zeta  | Configured     |


## Unzip xssHunter result:
```
for zip in *.zip; do
    base="${zip%.zip}"
    unzip -p "$zip" reflector_xss.txt > "${base}_URxss.txt" 2>/dev/null
    unzip -p "$zip" reflected.txt > "${base}_reflected.txt" 2>/dev/null
done
```
```
cat *_URxss.txt > xss.txt && rm *_URxss.txt
parallel -j "$(nproc)" 'sort {} -o {}.sorted' ::: *_reflected.txt
sort -u *.sorted > reflected.txt
rm -- *.sorted && rm *_reflected.txt
rm *.zip
```

# Everything after surfaceMapper download:

**1. Unzip all downloaded surfaceMapper xssMiner.zip file:**
```
find . -mindepth 1 -maxdepth 1 -type d \
  -exec sh -c '
    for d; do
      zip="$d/xssMiner.zip"
      [ -f "$zip" ] || continue
      unzip -o "$zip" -d "$d" >/dev/null
      if [ -f "$d/endpoints.txt" ] || [ -f "$d/param.txt" ] || [ -f "$d/urls.txt" ]; then
        rm -f "$zip"
      else
        echo "FAILED: $zip"
      fi
    done
  ' sh {} +
```

**2. Rename all folder using hostname:**
```
for d in */; do
  f="$d/endpoints.txt"
  [ -f "$f" ] || continue
  host=$(head -n1 "$f" | cut -d/ -f3)
  mv -- "$d" "$host"
done
```

**3: Rename all folder adding file size before hostname:**
```
find . -mindepth 2 -maxdepth 2 -name endpoints.txt -exec sh -c '
    for file do
        dir=$(dirname "$file")
        size=$(du -h "$file" | cut -f1)
        base=$(basename "$dir")

        case "$base" in
            "${size}"_*) continue ;;
        esac

        mv "$dir" "$dir/../${size}_${base}"
    done
' sh {} +
```
