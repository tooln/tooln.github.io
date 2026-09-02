## Zip all surfaceMapper:
```
for d in surfaceMapper{1..10}; do [ -d "$d" ] && 7z a -t7z -mx=3 -m0=lzma2 -mmt=on surfaceMapper.7z "$d"; done
```

## Everything after surfaceMapper download:

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

**2. Visit all Folder and run ../prepare_paramURLs.txt**
```
parallel -j16 --line-buffer '
    cd "{}" || exit
    bash ../../prepare_paramURLs.sh
' ::: */
```

**3. Merge big files using RAM/CPU:**
```
mkdir /tmp/sorttmp
LC_ALL=C sort -u --parallel=$(nproc) -S 16G -T /tmp/sorttmp file1.txt file2.txt > merged.txt
rm -rf /tmp/sorttmp
```
```
mkdir -p /tmp/sorttmp && \
LC_ALL=C sort -u --parallel="$(nproc)" -S 16G -T /tmp/sorttmp *.txt > merged.txt && \
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

**4. Make REFLECTESTTEST123 colorful:**
```
awk '/^\[REFLECTED\]/{print "\033[31m"$0"\033[0m";next}{gsub(/" REFLECTTEST123/,"\033[1;33m&\033[0m");print}' xss100.txt
```
