[ -r /etc/zshrc ] && . /etc/zshrc

# -------------------------------------------------------------
# Load secrets (API keys, tokens, etc.)
for file in ~/.secrets/*.sh(N); do
  source "$file"
done

# Load hooks (brew wrapper, etc.)
for file in ~/.zsh/hooks/*.zsh(N); do
  source "$file"
done

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# coreutils
# mac標準のBSDコマンドを coreutils の GNUコマンドに置き換える
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# -------------------------------------------------------------
# starship
eval "$(starship init zsh)"

# -------------------------------------------------------------
# ls コマンドに色を付ける
alias ls='ls --color=auto'

# al コマンドを作成する
alias al='ls -al --color=auto'

# vim を nvim に置き換える
alias vim='nvim'

# lazygit
alias lgit='lazygit'


# pnpm
export PNPM_HOME="/Users/shio3ch/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Antigravity
export PATH="/Users/shio3ch/.antigravity/antigravity/bin:$PATH"
