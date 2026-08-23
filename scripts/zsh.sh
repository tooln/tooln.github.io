#!/bin/bash

set -euo pipefail

# ============================================================
# Zsh + Oh My Zsh + Powerlevel10k + Plugins
# Fully non-interactive
# ============================================================

# 1) Ensure basics
echo "[*] Updating packages..."
apt update

echo "[*] Installing dependencies..."
apt install -y git curl zsh

# 2) Install Oh My Zsh if missing
ZSH_HOME="${HOME:-/root}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH_HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_HOME/.oh-my-zsh" ]; then
    echo "[*] Installing Oh My Zsh..."

    RUNZSH=no \
    CHSH=no \
    KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "[*] Oh My Zsh already installed."
fi

# 3) Prepare directories
mkdir -p "$ZSH_CUSTOM/plugins"
mkdir -p "$ZSH_CUSTOM/themes"

ZSHRC="$ZSH_HOME/.zshrc"

# Back up existing .zshrc
if [ -f "$ZSHRC" ] && [ ! -f "$ZSHRC.backup" ]; then
    cp "$ZSHRC" "$ZSHRC.backup"
    echo "[*] Backed up ~/.zshrc -> ~/.zshrc.backup"
fi

# 4) Clone plugins and theme
echo "[*] Installing zsh-autosuggestions..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone --depth=1 \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "[*] zsh-autosuggestions already present."
fi

echo "[*] Installing zsh-syntax-highlighting..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone --depth=1 \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "[*] zsh-syntax-highlighting already present."
fi

echo "[*] Installing Powerlevel10k..."

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "[*] powerlevel10k already present."
fi

# 5) Create a clean, fully non-interactive .zshrc
echo "[*] Configuring ~/.zshrc..."

cat > "$ZSHRC" <<EOF
# ============================================================
# Oh My Zsh
# ============================================================

export ZSH="\$HOME/.oh-my-zsh"

# Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins managed by Oh My Zsh
plugins=(
    git
    zsh-autosuggestions
)

# Oh My Zsh
source "\$ZSH/oh-my-zsh.sh"

# ============================================================
# zsh-syntax-highlighting
# Must be loaded after Oh My Zsh
# ============================================================

source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ============================================================
# Powerlevel10k
# ============================================================

[[ -f "\$HOME/.p10k.zsh" ]] && source "\$HOME/.p10k.zsh"

# Never launch the Powerlevel10k configuration wizard
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
EOF

# 6) Create Powerlevel10k configuration
echo "[*] Creating ~/.p10k.zsh..."

cat > "$ZSH_HOME/.p10k.zsh" <<'EOF'
# ============================================================
# Powerlevel10k configuration
# Fully non-interactive
# ============================================================

# Never show the configuration wizard
typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Prompt layout
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
)

# Directory colors
typeset -g POWERLEVEL9K_DIR_BACKGROUND=blue
typeset -g POWERLEVEL9K_DIR_FOREGROUND=white

# Git colors
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=green
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=yellow
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=yellow

# Command status
typeset -g POWERLEVEL9K_STATUS_OK=true
typeset -g POWERLEVEL9K_STATUS_CROSS=true

# Use Nerd Font icons when available
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'
EOF

# 7) Make sure zsh is an allowed login shell
ZSH_PATH="$(command -v zsh)"

if ! grep -qxF "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "[*] Adding $ZSH_PATH to /etc/shells..."
    echo "$ZSH_PATH" >> /etc/shells
fi

# 8) Change default shell automatically
CURRENT_USER="$(id -un)"
CURRENT_SHELL="$(getent passwd "$CURRENT_USER" | cut -d: -f7)"

if [ "$CURRENT_SHELL" != "$ZSH_PATH" ]; then
    echo "[*] Changing default shell to $ZSH_PATH..."
    chsh -s "$ZSH_PATH" "$CURRENT_USER"
else
    echo "[*] zsh is already the default shell."
fi

# 9) Disable all Powerlevel10k first-run prompts
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

echo
echo "============================================================"
echo " Zsh installation complete!"
echo "============================================================"
echo " User:          $CURRENT_USER"
echo " Shell:         $ZSH_PATH"
echo " Oh My Zsh:     $ZSH_HOME/.oh-my-zsh"
echo " Powerlevel10k: $ZSH_CUSTOM/themes/powerlevel10k"
echo "============================================================"
echo

# 10) Start zsh
echo "[*] Starting zsh..."
exec "$ZSH_PATH" -l
