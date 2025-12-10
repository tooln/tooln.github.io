## Remove unwanted static file links from all files in the current folder
```
for f in *.txt; do
    tmp=$(mktemp)
    grep -viE '\.(jpg|jpeg|png|gif|bmp|webp|svg|tiff|ico|woff|js|css|mp4|mp3|avi|mov|wav|flac|ogg|ttf|eot|woff2)(\?.*)?$' "$f" > "$tmp"
    mv "$tmp" "$f"
done
```
```
wc * | sort -nr
```
```
cat *.txt | sort -u > tmp
rm *.txt
mv tmp ../gau.txt
```
```
cat *.txt | sort -u > tmp
rm *.txt
mv tmp ../waybackurls.txt
```
```
cat gau.txt waybackurls.txt | sort -u > tmp
rm *.txt
mv tmp allLinks.txt
```
```
rm -rf gau/ waybackurls/
rm *.sh
```
```
awk -F/ 'NF >= 3 {print $1 "//" $3}' allLinks.txt | sort -u > hosts.txt
```
```
httpx -l "hosts.txt" -silent -o "alive_hosts.txt" -t 200
```
```
sort -u alive_hosts.txt > alive_hosts_clean.txt
```
## Normalize hosts (remove http(s)://)
```
sed -E 's#https?://##;s#/$##' alive_hosts_clean.txt | sort -u > hosts_clean.txt
```


## Keep only URLs belonging to alive hosts
```
grep -Ff hosts_clean.txt allLinks.txt > allAliveLinks.txt
```
```
rm alive_hosts.txt alive_hosts_clean.txt hosts.txt allLinks.txt hosts_clean.txt
```

## Chunked HTTPx Scanner
```
nano script.sh && chmod +x script.sh
```

```
#!/bin/bash

INPUT_FILE="allAliveLinks.txt"
CHUNK_SIZE=5000
THREADS=200
OUTPUT_FILE="urls.txt"
TEMP_DIR="chunks"

# Create temp directory
mkdir -p "$TEMP_DIR"

echo "[+] Splitting input into chunks of $CHUNK_SIZE lines..."
split -l "$CHUNK_SIZE" -d "$INPUT_FILE" "$TEMP_DIR/chunk_"

echo "[+] Starting HTTPx scanning on all chunks..."
for chunk in "$TEMP_DIR"/chunk_*; do
    echo "[*] Scanning $chunk ..."
    httpx -l "$chunk" -silent -fr -t "$THREADS" -o "${chunk}.out" 2>/dev/null
done

echo "[+] Combining and sorting unique alive results..."
cat "$TEMP_DIR"/chunk_*.out | sort -u > final_alive.txt

echo "[+] Shuffling final output..."
shuf final_alive.txt > "$OUTPUT_FILE"

echo "[✓] Done!"
echo "Output saved to: $OUTPUT_FILE"

echo "Wayback HTTPX Complete" | notify -provider discord -id spider -silent
rm -rf chunks final_alive.txt
```
