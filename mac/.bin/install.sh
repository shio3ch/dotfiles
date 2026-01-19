#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
MAC_DIR="$DOTFILES_DIR/mac"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "=== Dotfiles Installer ==="
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# バックアップとリンク作成の関数
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "  Backup: $dest -> $BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi

    ln -sf "$src" "$dest"
    echo "  Linked: $dest -> $src"
}

# 必要なディレクトリを作成
echo "[1/3] Creating directories..."
mkdir -p "$HOME/.config/git"
echo "  Created: ~/.config/git"
mkdir -p "$HOME/.secrets"
chmod 700 "$HOME/.secrets"
echo "  Created: ~/.secrets (mode 700)"

# シンボリックリンクを作成
echo ""
echo "[2/3] Creating symlinks..."

# zsh
link_file "$MAC_DIR/zsh/.zshrc" "$HOME/.zshrc"

# starship
link_file "$MAC_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# git
link_file "$MAC_DIR/git/.gitconfig" "$HOME/.gitconfig"
link_file "$MAC_DIR/git/ignore" "$HOME/.config/git/ignore"

# wezterm
link_file "$MAC_DIR/wezterm" "$HOME/.config/wezterm"

# secrets テンプレートをコピー
echo ""
echo "[3/3] Setting up secrets templates..."
for template in "$MAC_DIR/secrets/"*.template; do
    if [ -f "$template" ]; then
        filename=$(basename "$template")
        dest="$HOME/.secrets/$filename"
        if [ ! -e "$dest" ]; then
            cp "$template" "$dest"
            chmod 600 "$dest"
            echo "  Copied: $dest"
        else
            echo "  Skipped (exists): $dest"
        fi
    fi
done

echo ""
echo "=== Done! ==="
if [ -d "$BACKUP_DIR" ]; then
    echo "Backup files saved to: $BACKUP_DIR"
fi
echo ""
echo "Next steps:"
echo "  1. Edit files in ~/.secrets/ to add your API keys"
echo "  2. Rename .template files to .sh (e.g., example.sh.template -> openai.sh)"
echo "  3. Restart your shell or run: source ~/.zshrc"
