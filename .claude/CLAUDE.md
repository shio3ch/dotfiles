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

1. このリポジトリ内のファイルを直接編集する（`chezmoi edit` でも可）
2. 変更後は必ず `chezmoi apply` で `$HOME` に反映する
3. 新しいツールの設定を追加・構造変更した場合は **`.claude/CLAUDE.md`** の構造セクションも更新すること

```shell
# 変更を確認してから適用
chezmoi diff
chezmoi apply

# または alias を使う（dot_zshrc に定義済み）
cdiff   # chezmoi diff
capply  # chezmoi apply
cupdate # chezmoi update（リモートから pull して apply）
```

## 使用ツール

- **chezmoi**: dotfiles管理ツール
- **Claude Code**: AI搭載のCLI開発ツール
- **Ghostty**: Catppuccin Mochaテーマのターミナルエミュレータ
- **Starship**: Catppuccin Mochaテーマのシェルプロンプト
- **nodebrew**: Node.jsバージョン管理
- **pnpm**: パッケージマネージャ
- **coreutils**: GNU版コマンド（Homebrew経由）
- **Neovim**: LazyVimベースの設定
