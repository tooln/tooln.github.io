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

**3. Rename all folder adding file size before hostname:**
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

**4. Visit all Folder and run ../prepare_paramURLs.txt**
```
parallel -j32 --line-buffer '
    cd "{}" || exit
    bash ../../prepare_paramURLs.sh
' ::: */
```

**5. Merge big files using RAM/CPU:**
```
mkdir /tmp/sorttmp
LC_ALL=C sort -u --parallel=$(nproc) -S 16G -T /tmp/sorttmp all.txt paramURLs.txt > merged.txt
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
