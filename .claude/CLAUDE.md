# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人用dotfiles（設定ファイル）の管理リポジトリ。[chezmoi](https://chezmoi.io/) で管理。macOSとWindowsの環境設定を管理。

## 構造

```
dotfiles/
├── .chezmoi.toml.tmpl          # chezmoi設定テンプレート（Git user情報）
├── Brewfile                    # Homebrewパッケージリスト
├── dot_zshrc                   # ~/.zshrc
├── dot_gitconfig.tmpl          # ~/.gitconfig（テンプレート）
├── dot_config/
│   ├── git/ignore              # ~/.config/git/ignore
│   ├── starship/starship.toml  # ~/.config/starship.toml
│   ├── nvim/                   # ~/.config/nvim/（LazyVim）
│   └── ghostty/config          # ~/.config/ghostty/config
├── dot_claude/
│   ├── CLAUDE.md               # ~/.claude/CLAUDE.md
│   └── settings.json           # ~/.claude/settings.json
├── dot_zsh/hooks/brew.zsh      # ~/.zsh/hooks/brew.zsh
├── run_onchange_install-packages.sh.tmpl  # Homebrewパッケージインストール
├── run_once_setup-macos.sh     # macOS初期設定
├── run_once_setup-secrets.sh.tmpl  # ~/.secrets/ ディレクトリのセットアップ
└── windows/
    └── terminal/               # Windows Terminal設定
```

## chezmoi ファイル命名規則

- `dot_` プレフィックス → ドットファイル/ディレクトリ（例: `dot_zshrc` → `~/.zshrc`）
- `.tmpl` サフィックス → テンプレートファイル（chezmoi変数を使用）
- `run_once_` プレフィックス → 初回のみ実行するスクリプト
- `run_onchange_` プレフィックス → ファイル変更時に実行するスクリプト

## セットアップ

### macOS

```shell
brew install chezmoi
chezmoi init --apply https://github.com/shio3ch/dotfiles.git
```

## 開発ルール

### 設定ファイルの追加・変更時

新しいツールの設定を追加、または既存の設定構造を変更した場合、以下のファイルも必ず同期すること:

1. **`.claude/CLAUDE.md`** - 構造セクションとセットアップ手順を更新
2. 必要に応じて使用ツールセクションも更新

## 使用ツール

- **chezmoi**: dotfiles管理ツール
- **Claude Code**: AI搭載のCLI開発ツール
- **Ghostty**: Catppuccin Mochaテーマのターミナルエミュレータ
- **Starship**: Catppuccin Mochaテーマのシェルプロンプト
- **nodebrew**: Node.jsバージョン管理
- **pnpm**: パッケージマネージャ
- **coreutils**: GNU版コマンド（Homebrew経由）
- **Neovim**: LazyVimベースの設定
