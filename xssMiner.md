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
| Miner1 | alpha | Configured     |
| Miner2 | beta  | Configured     |
| Miner3 | gamma | Configured     |
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
cat *_URxss.txt > xss.txt && rm *_URxss.txt
parallel -j "$(nproc)" 'sort {} -o {}.sorted' ::: *_reflected.txt
sort -u *.sorted > reflected.txt
rm -- *.sorted && rm *_reflected.txt
rm *.zip
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

### Show endpoints.txt human-readable size
```
developer@linux ~/Downloads/xssMiner% find . -name endpoints.txt -exec du -h {} \; | sort -h
420K	./payoneer.com.cn/endpoints.txt
864K	./aic.sg/endpoints.txt
880K	./skuad.io/endpoints.txt
888K	./visaprepaidprocessing.com/endpoints.txt
980K	./sodastream.pl/endpoints.txt
```
