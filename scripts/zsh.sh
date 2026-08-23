#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# ============================================================
# Basic information
# ============================================================

USER_NAME="$(id -un)"
USER_HOME="$(getent passwd "$USER_NAME" | cut -d: -f6)"

echo "[*] Installing Zsh dependencies..."

apt-get update -y
apt-get install -y git curl zsh

ZSH_PATH="$(command -v zsh)"

ZSH_DIR="$USER_HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH_DIR/custom"
ZSHRC="$USER_HOME/.zshrc"
P10K="$USER_HOME/.p10k.zsh"

# ============================================================
# Install Oh My Zsh
# ============================================================

if [ ! -d "$ZSH_DIR" ]; then
    echo "[*] Installing Oh My Zsh..."

    RUNZSH=no \
    CHSH=no \
    KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "[*] Oh My Zsh already installed."
fi

# ============================================================
# Prepare directories
# ============================================================

mkdir -p "$ZSH_CUSTOM/plugins"
mkdir -p "$ZSH_CUSTOM/themes"

# ============================================================
# Install autosuggestions
# ============================================================

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "[*] Installing zsh-autosuggestions..."

    git clone --depth=1 \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# ============================================================
# Install syntax highlighting
# ============================================================

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "[*] Installing zsh-syntax-highlighting..."

    git clone --depth=1 \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# ============================================================
# Install Powerlevel10k
# ============================================================

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "[*] Installing Powerlevel10k..."

    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# ============================================================
# Backup old configuration
# ============================================================

if [ -f "$ZSHRC" ] && [ ! -f "$ZSHRC.backup" ]; then
    cp "$ZSHRC" "$ZSHRC.backup"
    echo "[*] Existing ~/.zshrc backed up to ~/.zshrc.backup"
fi

if [ -f "$P10K" ] && [ ! -f "$P10K.backup" ]; then
    cp "$P10K" "$P10K.backup"
    echo "[*] Existing ~/.p10k.zsh backed up to ~/.p10k.zsh.backup"
fi

# ============================================================
# Create .zshrc
# ============================================================

echo "[*] Creating ~/.zshrc..."

cat > "$ZSHRC" <<'EOF'
# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================
# Oh My Zsh
# ============================================================

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# Syntax highlighting must be loaded LAST.
source "$ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ============================================================
# Powerlevel10k
# ============================================================

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# ============================================================
# Go environment
# ============================================================

if [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

# ============================================================
# Local binaries
# ============================================================

export PATH="$HOME/.local/bin:$PATH"

# ============================================================
# Custom cls command
# ============================================================

cls() {
  clear
  ls
  tmux ls
}

# ============================================================
# gau
# ============================================================

unalias gau 2>/dev/null
alias gau='command gau'
EOF

# ============================================================
# Create custom Powerlevel10k design
# ============================================================

echo "[*] Creating custom Powerlevel10k theme..."

cat > "$P10K" <<'EOF'
# ============================================================
# Custom Powerlevel10k design
#
# Example:
#
#   ~  ls                                      ✓ | root@host | 12:34:56 PM
#
# ============================================================

typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# ------------------------------------------------------------
# Instant prompt
# ------------------------------------------------------------

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ------------------------------------------------------------
# Clean prompt
# ------------------------------------------------------------

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_current_directory
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  custom_user_host
  time
)

# ------------------------------------------------------------
# No Powerlevel10k boxes / separators
# ------------------------------------------------------------

typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=''

typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# ------------------------------------------------------------
# Directory
# ------------------------------------------------------------

function prompt_custom_current_directory() {
  local dir="${PWD/#$HOME/~}"

  if [[ "$dir" == "/" ]]; then
    dir="/"
  fi

  p10k segment \
    -f white \
    -i ' ' \
    -t "$dir"
}

typeset -g POWERLEVEL9K_CUSTOM_CURRENT_DIRECTORY_FOREGROUND=white

# ------------------------------------------------------------
# Status
#
# ✓ = command succeeded
# ✗ = command failed
# ------------------------------------------------------------

typeset -g POWERLEVEL9K_STATUS_OK=true
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=green
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=red

typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✓'
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✗'

typeset -g POWERLEVEL9K_STATUS_CONTENT_EXPANSION=''

# ------------------------------------------------------------
# User + hostname
#
# root@xss5
# ------------------------------------------------------------

function prompt_custom_user_host() {
  p10k segment \
    -f cyan \
    -i '' \
    -t '%n@%m'
}

typeset -g POWERLEVEL9K_CUSTOM_USER_HOST_FOREGROUND=cyan

# ------------------------------------------------------------
# Time
# ------------------------------------------------------------

typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%I:%M:%S %p}'
typeset -g POWERLEVEL9K_TIME_FOREGROUND=yellow

# ------------------------------------------------------------
# Spacing
# ------------------------------------------------------------

typeset -g POWERLEVEL9K_STATUS_VISUAL_IDENTIFIER_EXPANSION=''
typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=''

# Keep the prompt visually similar to the original:
#
#   ~  command                              ✓ | root@host | 12:34:56 PM
#
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  custom_user_host
  time
)
EOF

# ============================================================
# Make Zsh an allowed login shell
# ============================================================

if ! grep -qxF "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "$ZSH_PATH" >> /etc/shells
fi

# ============================================================
# Change default shell automatically
# ============================================================

CURRENT_SHELL="$(getent passwd "$USER_NAME" | cut -d: -f7)"

if [ "$CURRENT_SHELL" != "$ZSH_PATH" ]; then
    echo "[*] Changing default shell to zsh..."
    chsh -s "$ZSH_PATH" "$USER_NAME"
fi

# ============================================================
# Fix ownership
# ============================================================

USER_GROUP="$(id -gn "$USER_NAME")"

chown -R "$USER_NAME:$USER_GROUP" "$ZSH_DIR" 2>/dev/null || true
chown "$USER_NAME:$USER_GROUP" "$ZSHRC" "$P10K" 2>/dev/null || true

# ============================================================
# Finish
# ============================================================

echo
echo "============================================================"
echo " ZSH SETUP COMPLETE"
echo "============================================================"
echo " User:          $USER_NAME"
echo " Shell:         $ZSH_PATH"
echo " Oh My Zsh:     OK"
echo " Powerlevel10k: OK"
echo " Autosuggestions: OK"
echo " Syntax highlighting: OK"
echo " Default shell: $ZSH_PATH"
echo " Setup wizard:  DISABLED"
echo "============================================================"
echo

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

exec "$ZSH_PATH" -l
