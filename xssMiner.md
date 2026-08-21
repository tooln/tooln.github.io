### Zip all surfaceMapper:
```
for d in surfaceMapper{1..10}; do [ -d "$d" ] && 7z a -t7z -mx=9 -m0=lzma2 -mmt=on surfaceMapper.7z "$d"; done
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
    f="${d%/}/endpoints.txt"
    [ -f "$f" ] || continue

    host=""

    while IFS= read -r line; do
        candidate=$(printf '%s\n' "$line" | sed -nE 's#^[a-zA-Z][a-zA-Z0-9+.-]*://([^/:]+).*#\1#p')

        [[ "$candidate" =~ ^[A-Za-z0-9.-]+$ ]] || continue
        [[ "$candidate" == *.* ]] || continue

        host=$(printf '%s\n' "$candidate" | awk -F. '{
            if (NF <= 3) print
            else print $(NF-2) "." $(NF-1) "." $NF
        }')

        break
    done < "$f"

    [ -n "$host" ] || {
        echo "SKIP: no valid hostname found in $f"
        continue
    }

    newname="$host"
    n=1

    while [ -e "$newname" ]; do
        newname="${host}${n}"
        ((n++))
    done

    echo "MOVE: ${d%/} -> $newname"
    mv -- "$d" "$newname"
done
```

**3. Prediction File size: paramURLs.txt**
```
total=0

for d in */; do
    eb=$(wc -c < "${d}endpoints.txt")
    ec=$(wc -l < "${d}endpoints.txt")
    pb=$(wc -c < "${d}param.txt")
    pc=$(wc -l < "${d}param.txt")

    size=$(awk -v eb="$eb" -v ec="$ec" -v pb="$pb" -v pc="$pc" \
        'BEGIN { printf "%.0f", ec * pc * (eb/ec + pb/pc + 5) }')

    total=$((total + size))

    awk -v d="$d" -v s="$size" 'BEGIN {
        printf "%-35s %.2f GB\n", d, s/1e9
    }'
done

echo "---------------------------------------------"

awk -v s="$total" 'BEGIN {
    printf "%-35s %.2f GB\n", "TOTAL", s/1e9
}'
```

**4. Visit all Folder and run ../prepare_paramURLs.txt**
```
parallel -j16 --line-buffer '
    cd "{}" || exit
    bash ../../prepare_paramURLs.sh
' ::: */
```

**5. Rename all folder adding file size of paramURLs.txt:**
```
find . -mindepth 2 -maxdepth 2 -name paramURLs.txt -exec sh -c '
    for file do
        dir=$(dirname "$file")
        bytes=$(wc -c < "$file")
        base=$(basename "$dir")

        case "$base" in
            KB[0-9]*_*|MB[0-9]*_*|GB[0-9]*_*) continue ;;
        esac

        if [ "$bytes" -ge 1073741824 ]; then
            size=$(awk "BEGIN {printf \"%.1f\", $bytes/1073741824}")
            unit=GB
        elif [ "$bytes" -ge 1048576 ]; then
            size=$(awk "BEGIN {printf \"%.1f\", $bytes/1048576}")
            unit=MB
        elif [ "$bytes" -ge 1024 ]; then
            size=$(awk "BEGIN {printf \"%.1f\", $bytes/1024}")
            unit=KB
        else
            size=$bytes
            unit=B
        fi

        mv -- "$dir" "$dir/../${unit}${size}_${base}"
    done
' sh {} +
```

**6. Merge big files using RAM/CPU:**
```
mkdir /tmp/sorttmp
LC_ALL=C sort -u --parallel=$(nproc) -S 16G -T /tmp/sorttmp file1.txt file2.txt > merged.txt
rm -rf /tmp/sorttmp
```
```
rm -rf /tmp/xss-sort
mkdir -p /tmp/xss-sort
find . -type f -name 'paramURLs.txt' -exec cat {} + |
  LC_ALL=C sort -u \
    --parallel=16 \
    -S 26G \
    -T /tmp/xss-sort \
    > merged.txt
rm -rf /tmp/xss-sort
```
