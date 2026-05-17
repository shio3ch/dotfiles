# dotfiles

設定ファイルの掃き溜めです。[chezmoi](https://chezmoi.io/) で管理しています。

## 構造

```
dotfiles/
├── .chezmoi.toml.tmpl          # chezmoi設定テンプレート（Git user情報）
├── Brewfile                    # macOS Homebrewパッケージリスト
├── ubuntu/packages.txt         # Ubuntu aptパッケージリスト
├── secrets/example.sh.template # ~/.secrets 用テンプレート
├── dot_zshrc.tmpl              # ~/.zshrc（OS別テンプレート）
├── dot_gitconfig.tmpl          # ~/.gitconfig（テンプレート）
├── dot_config/
│   ├── git/ignore              # ~/.config/git/ignore
│   ├── starship/starship.toml  # ~/.config/starship.toml
│   ├── nvim/                   # ~/.config/nvim/（LazyVim）
│   └── ghostty/config.tmpl     # ~/.config/ghostty/config（OS別テンプレート）
├── dot_claude/
│   ├── CLAUDE.md               # ~/.claude/CLAUDE.md
│   └── settings.json           # ~/.claude/settings.json
├── dot_zsh/hooks/brew.zsh      # ~/.zsh/hooks/brew.zsh（brewがある場合のみ有効）
├── run_onchange_install-packages.sh.tmpl  # OS別パッケージインストール
├── run_once_setup-macos.sh.tmpl     # macOS初期設定（macOSのみ実行）
├── run_once_setup-ubuntu.sh.tmpl    # Ubuntu初期設定（Linuxのみ実行）
├── run_once_setup-secrets.sh.tmpl   # ~/.secrets/ ディレクトリのセットアップ
└── windows/
    └── terminal/               # Windows Terminal設定（手動）
```

## macOS セットアップ

### 前提条件

- [Homebrew](https://brew.sh/) をインストール済みであること

### インストール

```shell
# chezmoi を Homebrew でインストール
brew install chezmoi

# dotfiles を初期化（Git user name/email を対話的に入力）
chezmoi init --apply https://github.com/shio3ch/dotfiles.git
```

`chezmoi init --apply` を実行すると:
1. `~/.local/share/chezmoi/` にこのリポジトリをクローン
2. Git user name / email を対話的に入力
3. dotfiles を `$HOME` に配置
4. Homebrew パッケージをインストール（`Brewfile`）
5. macOS 初期設定を適用

## Ubuntu / Hermes-VPS セットアップ

### 前提条件

- Ubuntu 24.04 LTS 想定
- `git`, `curl`, `sudo` が使えること

### インストール

```shell
# chezmoi をインストール
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"

# dotfiles を初期化（Git user name/email を対話的に入力）
"$HOME/.local/bin/chezmoi" init --apply https://github.com/shio3ch/dotfiles.git
```

`chezmoi init --apply` を実行すると:
1. `~/.local/share/chezmoi/` にこのリポジトリをクローン
2. Git user name / email を対話的に入力
3. dotfiles を `$HOME` に配置
4. `ubuntu/packages.txt` の apt パッケージをインストール
5. `fd` / `bat` の Ubuntu 向け互換 symlink を `~/.local/bin` に作成
6. macOS 専用の `defaults` / `killall Finder` などは実行しない

## 更新

```shell
chezmoi update
```

## dotfiles の編集

```shell
# 特定ファイルを編集
chezmoi edit ~/.zshrc

# 変更を確認
chezmoi diff

# 変更を適用
chezmoi apply
```

## OS 別の扱い

- macOS: `Brewfile` と Homebrew を使う。macOS 専用の zsh PATH / Ghostty 設定を適用する。
- Ubuntu: `ubuntu/packages.txt` と apt を使う。macOS 専用コマンドや `/Users/...` 固定パスは使わない。
- `dot_zshrc.tmpl` は未インストールのコマンドがあっても zsh 起動時にエラーにならないよう、`command -v` で存在確認してから alias / init を設定する。

## windows

Windows Terminal の設定ファイル。手動で設定をインポートする。
