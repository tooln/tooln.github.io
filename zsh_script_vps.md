### Create Bash Script:
```
nano script.sh && chmod +x script.sh && ./script.sh
```

### Script:
```
set -euo pipefail

# 1) Ensure basics
apt update
apt install -y git curl zsh || true

# 2) Install Oh My Zsh if missing (non-interactive)
if [ ! -d "${HOME:-/root}/.oh-my-zsh" ]; then
  echo "[*] Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "[*] Oh My Zsh already installed."
fi

# 3) Prepare ZSH_CUSTOM and back up existing .zshrc
ZSH_CUSTOM="${ZSH_CUSTOM:-${HOME:-/root}/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/plugins" "$ZSH_CUSTOM/themes"
cp -n "${HOME:-/root}/.zshrc" "${HOME:-/root}/.zshrc.backup" || true
echo "[*] Backed up ~/.zshrc -> ~/.zshrc.backup (if not already)"

# 4) Clone plugins + theme (idempotent)
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || echo "[*] zsh-autosuggestions already present"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || echo "[*] zsh-syntax-highlighting already present"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM/themes/powerlevel10k" 2>/dev/null || echo "[*] powerlevel10k already present"

echo "[*] Plugins and theme cloned."

# 5) Ensure .zshrc has correct theme & plugin lines
ZSHRC="${HOME:-/root}/.zshrc"

# set Powerlevel10k theme
if grep -q "^ZSH_THEME=" "$ZSHRC"; then
  sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
else
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
fi

# ensure plugins line exists; add if missing
if ! grep -q "^plugins=" "$ZSHRC"; then
  echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> "$ZSHRC"
else
  # insert plugins if not present
  if ! grep -q "zsh-autosuggestions" "$ZSHRC"; then
    sed -i '/^plugins=/ s/)/ zsh-autosuggestions)/' "$ZSHRC"
  fi
  if ! grep -q "zsh-syntax-highlighting" "$ZSHRC"; then
    sed -i '/^plugins=/ s/)/ zsh-syntax-highlighting)/' "$ZSHRC"
  fi
fi

# 6) Ensure zsh-syntax-highlighting is sourced last (must be after OMZ loads)
SH_LINE="source ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if ! grep -Fxq "$SH_LINE" "$ZSHRC"; then
  echo "" >> "$ZSHRC"
  echo "# ensure syntax highlighting is loaded last" >> "$ZSHRC"
  echo "$SH_LINE" >> "$ZSHRC"
fi

echo "[*] .zshrc patched. Backup at ~/.zshrc.backup"

# 7) Apply immediately
echo "[*] Reloading zsh..."
exec zsh
```
```
nnny 223 1111 n1y
```
### Must be:
```
chsh -s $(which zsh)
```
