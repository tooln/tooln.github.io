```
nano setup-zsh.sh && chmod +x setup-zsh.sh
```

```
#!/usr/bin/env bash

set -e

echo "🔄 Updating system..."
sudo apt update

echo "📦 Installing Zsh and dependencies..."
sudo apt install -y zsh git curl

echo "⭐ Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "🔌 Installing plugins..."

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# Autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Syntax highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

echo "⚙️ Writing clean .zshrc..."

cat > "$HOME/.zshrc" << 'EOF'
# ---------- Oh My Zsh ----------
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ---------- Custom Prompt ----------
PROMPT='%n@%m:%~ $ '

# ---------- History ----------
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# ---------- Navigation ----------
setopt AUTO_CD

# ---------- Completion ----------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ---------- Environment ----------
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# ---------- Aliases ----------
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

alias ..="cd .."
alias ...="cd ../.."

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# ---------- Misc ----------
DISABLE_UNTRACKED_FILES_DIRTY="true"
EOF

echo "🐚 Setting Zsh as default shell..."
chsh -s "$(which zsh)"

echo "✅ Done! Restart your terminal or run: zsh"
```
