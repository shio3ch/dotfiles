# dotfiles

設定ファイルの掃き溜めです。

## 構造

```
dotfiles/
├── mac/
│   ├── .bin/          # インストールスクリプト
│   ├── git/           # Git設定
│   ├── starship/      # Starshipプロンプト
│   ├── wezterm/       # WezTermターミナル
│   └── zsh/           # Zsh設定
└── windows/
    └── terminal/      # Windows Terminal設定
```

## mac

### インストール

```shell
cd ~
git clone https://github.com/shio3ch/dotfiles.git
~/dotfiles/mac/.bin/install.sh
```

### 含まれる設定

| 設定 | 説明 |
|-----|------|
| `.zshrc` | Zsh設定（starship, nodebrew, pnpm, coreutils） |
| `starship.toml` | Starshipプロンプト（Catppuccin Mocha） |
| `.gitconfig` | Git設定 |
| `wezterm/` | WezTerm設定（Catppuccin Mocha, tmux風キーバインド） |

### 前提条件

- [Homebrew](https://brew.sh/)
- [Starship](https://starship.rs/) - `brew install starship`
- [WezTerm](https://wezfurlong.org/wezterm/) - `brew install --cask wezterm`
- [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/) - `brew install --cask font-caskaydia-cove-nerd-font`
- [nodebrew](https://github.com/hokaccha/nodebrew)
- [pnpm](https://pnpm.io/)
- coreutils - `brew install coreutils`

## windows

Windows Terminal の設定ファイル。手動で設定をインポートする。
