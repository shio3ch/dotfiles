# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人用dotfiles（設定ファイル）の管理リポジトリ。macOSとWindowsの環境設定を管理。

## 構造

```
dotfiles/
├── mac/
│   ├── git/           # Git設定 (.gitconfig, ignore)
│   ├── starship/      # Starshipプロンプト設定
│   ├── wezterm/       # WezTerm設定 (Lua)
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
ln -sf ~/dotfiles/mac/wezterm ~/.config/wezterm
```

## 使用ツール

- **Starship**: Catppuccin Mochaテーマのシェルプロンプト
- **WezTerm**: Catppuccin Mochaテーマ、tmux風キーバインド（Leader: Ctrl+q）
- **nodebrew**: Node.jsバージョン管理
- **pnpm**: パッケージマネージャ
- **coreutils**: GNU版コマンド（Homebrew経由）
