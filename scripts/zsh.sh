#!/bin/bash

set -euo pipefail

# ============================================================
# Zsh + Oh My Zsh + Powerlevel10k
# Fully automatic / non-interactive
# ============================================================

export DEBIAN_FRONTEND=noninteractive

USER_NAME="$(id -un)"
USER_HOME="$(getent passwd "$USER_NAME" | cut -d: -f6)"
ZSH_PATH="$(command -v zsh || true)"

echo "[*] Installing required packages..."
apt-get update -y
apt-get install -y git curl zsh

ZSH_PATH="$(command -v zsh)"
ZSH_DIR="$USER_HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH_DIR/custom"
ZSHRC="$USER_HOME/.zshrc"
P10K="$USER_HOME/.p10k.zsh"

# ============================================================
# 1. Install Oh My Zsh
# ============================================================

if [ ! -d "$ZSH_DIR" ]; then
    echo "[*] Installing Oh My Zsh..."

    export RUNZSH=no
    export CHSH=no
    export KEEP_ZSHRC=yes

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "[*] Oh My Zsh already installed."
fi

# ============================================================
# 2. Prepare custom directories
# ============================================================

mkdir -p "$ZSH_CUSTOM/plugins"
mkdir -p "$ZSH_CUSTOM/themes"

# ============================================================
# 3. Install zsh-autosuggestions
# ============================================================

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "[*] Installing zsh-autosuggestions..."

    git clone --depth=1 \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "[*] zsh-autosuggestions already installed."
fi

# ============================================================
# 4. Install zsh-syntax-highlighting
# ============================================================

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "[*] Installing zsh-syntax-highlighting..."

    git clone --depth=1 \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "[*] zsh-syntax-highlighting already installed."
fi

# ============================================================
# 5. Install Powerlevel10k
# ============================================================

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "[*] Installing Powerlevel10k..."

    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "[*] Powerlevel10k already installed."
fi

# ============================================================
# 6. Backup existing configuration
# ============================================================

if [ -f "$ZSHRC" ] && [ ! -f "$ZSHRC.backup" ]; then
    cp "$ZSHRC" "$ZSHRC.backup"
    echo "[*] Existing ~/.zshrc backed up."
fi

# ============================================================
# 7. Create .zshrc
# ============================================================

echo "[*] Creating ~/.zshrc..."

cat > "$ZSHRC" <<'EOF'
# ============================================================
# Powerlevel10k instant prompt
# ============================================================

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

# Syntax highlighting MUST be loaded after Oh My Zsh
source "$ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ============================================================
# Powerlevel10k
# ============================================================

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# ============================================================
# Go environment
# ============================================================

if [ -d "/usr/local/go" ]; then
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
    tmux ls 2>/dev/null || true
}

# ============================================================
# gau
# ============================================================

unalias gau 2>/dev/null
alias gau='command gau'
EOF

# ============================================================
# 8. Create attractive Powerlevel10k configuration
# ============================================================

echo "[*] Creating Powerlevel10k configuration..."

cat > "$P10K" <<'EOF'
# ============================================================
# Powerlevel10k
# Fully automatic configuration
# ============================================================

typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ============================================================
# Prompt
# ============================================================

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon
    dir
    vcs
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    time
)

typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}❯%f '

# ============================================================
# Nerd Font
# ============================================================

typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

# ============================================================
# OS
# ============================================================

typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=cyan

# ============================================================
# Directory
# ============================================================

typeset -g POWERLEVEL9K_DIR_BACKGROUND=blue
typeset -g POWERLEVEL9K_DIR_FOREGROUND=white
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=white
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=white

typeset -g POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_unique'
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=4

# ============================================================
# Git
# ============================================================

typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=green
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=yellow
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=yellow
typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=red
typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=yellow

typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

# ============================================================
# Command status
# ============================================================

typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
typeset -g POWERLEVEL9K_STATUS_OK=true
typeset -g POWERLEVEL9K_STATUS_CROSS=true

typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=green
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=red

# ============================================================
# Command execution time
# ============================================================

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0

# ============================================================
# Background jobs
# ============================================================

typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=yellow

# ============================================================
# Clock
# ============================================================

typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%I:%M:%S %p}'
typeset -g POWERLEVEL9K_TIME_FOREGROUND=cyan

# ============================================================
# Separators
# ============================================================

typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' '

# ============================================================
# Transient prompt
# ============================================================

typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

# ============================================================
# Context
# ============================================================

typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=cyan
EOF

# ============================================================
# 9. Ensure zsh is an allowed login shell
# ============================================================

if ! grep -qxF "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "[*] Adding zsh to /etc/shells..."
    echo "$ZSH_PATH" >> /etc/shells
fi

# ============================================================
# 10. Change default shell
# ============================================================

CURRENT_SHELL="$(getent passwd "$USER_NAME" | cut -d: -f7)"

if [ "$CURRENT_SHELL" != "$ZSH_PATH" ]; then
    echo "[*] Changing default shell to zsh..."
    chsh -s "$ZSH_PATH" "$USER_NAME"
else
    echo "[*] zsh is already the default shell."
fi

# ============================================================
# 11. Fix ownership
# ============================================================

USER_GROUP="$(id -gn "$USER_NAME")"

chown -R "$USER_NAME:$USER_GROUP" \
    "$ZSH_DIR" \
    "$ZSHRC" \
    "$P10K" 2>/dev/null || true

# ============================================================
# 12. Done
# ============================================================

echo
echo "============================================================"
echo " ZSH SETUP COMPLETE"
echo "============================================================"
echo " User:          $USER_NAME"
echo " Shell:         $ZSH_PATH"
echo " Oh My Zsh:     installed"
echo " Powerlevel10k: installed"
echo " Autosuggestions: installed"
echo " Syntax highlighting: installed"
echo " Default shell: changed"
echo " Interactive setup: DISABLED"
echo "============================================================"
echo

# Start login zsh
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
exec "$ZSH_PATH" -l
