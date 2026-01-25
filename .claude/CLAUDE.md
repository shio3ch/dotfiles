# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人用dotfiles（設定ファイル）の管理リポジトリ。macOSとWindowsの環境設定を管理。

## 構造

```
dotfiles/
├── mac/
│   ├── git/           # Git設定 (.gitconfig, ignore)
│   ├── nvim/          # Neovim設定 (LazyVim)
│   ├── starship/      # Starshipプロンプト設定
│   └── zsh/           # Zsh設定 (.zshrc)
└── windows/
    └── terminal/      # Windows Terminal設定
```

## セットアップ

### macOS

```shell
cd ~
git clone https://github.com/shio3ch/dotfiles.git

# シンボリックリンクを作成
ln -sf ~/dotfiles/mac/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/mac/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/mac/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/mac/git/ignore ~/.config/git/ignore

# Neovim（既存の設定がある場合は先にバックアップ）
# mv ~/.config/nvim ~/.config/nvim.bak
ln -sfn ~/dotfiles/mac/nvim ~/.config/nvim
```

## 使用ツール

- **Starship**: Catppuccin Mochaテーマのシェルプロンプト
- **nodebrew**: Node.jsバージョン管理
- **pnpm**: パッケージマネージャ
- **coreutils**: GNU版コマンド（Homebrew経由）
- **Neovim**: LazyVimベースの設定
