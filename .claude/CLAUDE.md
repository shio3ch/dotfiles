# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人用dotfiles（設定ファイル）の管理リポジトリ。macOSとWindowsの環境設定を管理。

## 構造

```
dotfiles/
├── mac/
│   ├── claude/        # Claude Code設定 (CLAUDE.md, settings.json)
│   ├── ghostty/       # Ghosttyターミナル設定
│   ├── git/           # Git設定 (.gitconfig, .gitconfig.user, ignore)
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

# git ユーザー情報（初回のみコピー、実際の値を記入）
cp ~/dotfiles/mac/git/.gitconfig.user ~/.gitconfig.user
# ~/.gitconfig.user に name と email を設定すること

# Neovim（既存の設定がある場合は先にバックアップ）
# mv ~/.config/nvim ~/.config/nvim.bak
ln -sfn ~/dotfiles/mac/nvim ~/.config/nvim

# Ghostty
ln -sf ~/dotfiles/mac/ghostty/config ~/.config/ghostty/config

# Claude Code
ln -sf ~/dotfiles/mac/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sf ~/dotfiles/mac/claude/settings.json ~/.claude/settings.json
```

## 開発ルール

### 設定ファイルの追加・変更時

新しいツールの設定を追加、または既存の設定構造を変更した場合、以下のファイルも必ず同期すること:

1. **`mac/.bin/install.sh`** - シンボリックリンク作成処理を追加
2. **`.claude/CLAUDE.md`** - 構造セクションとセットアップ手順を更新
3. 必要に応じて使用ツールセクションも更新

## 使用ツール

- **Claude Code**: AI搭載のCLI開発ツール
- **Ghostty**: Catppuccin Mochaテーマのターミナルエミュレータ
- **Starship**: Catppuccin Mochaテーマのシェルプロンプト
- **nodebrew**: Node.jsバージョン管理
- **pnpm**: パッケージマネージャ
- **coreutils**: GNU版コマンド（Homebrew経由）
- **Neovim**: LazyVimベースの設定
