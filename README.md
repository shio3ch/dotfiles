# dotfiles

設定ファイルの掃き溜めです。[chezmoi](https://chezmoi.io/) で管理しています。

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

### 更新

```shell
chezmoi update
```

### dotfiles の編集

```shell
# 特定ファイルを編集
chezmoi edit ~/.zshrc

# 変更を確認
chezmoi diff

# 変更を適用
chezmoi apply
```

## windows

Windows Terminal の設定ファイル。手動で設定をインポートする。
