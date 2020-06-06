source .zprofile

#--------------------------------------------------------------
# 環境変数
#--------------------------------------------------------------


#--------------------------------------------------------------
# プロンプト表示
#--------------------------------------------------------------
#PROMPT='@%F{blue}%n%f%F{green}[%~]%f %# '
#RPROMPT=''

#--------------------------------------------------------------
# Gitプロンプトプラグイン
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.zsh/plugin/.git-prompt.sh
#--------------------------------------------------------------
#source ~/.zsh/plugin/.git-prompt.sh
#setopt PROMPT_SUBST
#PS1='%n@%m [%F{yellow}%c%f]$(__git_ps1 " (%s)")\$ '
#RPROMPT='$(__git_ps1 "(%s)")'


#--------------------------------------------------------------
# Zinit plugins
#--------------------------------------------------------------
source ~/.zinit/bin/zinit.zsh

# 補完
# zinit light zsh-users/zsh-autosuggestions

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting
#
# # Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word

#--------------------------------------------------------------
# Prezto
#--------------------------------------------------------------
zinit snippet PZT::modules/helper/init.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k

#--------------------------------------------------------------
# Prompt plugin - powerlevel10k
# https://github.com/romkatv/powerlevel10k
#--------------------------------------------------------------
[[ ! -f ~/.zsh/plugins/.p10k.zsh ]] || source ~/.zsh/plugins/.p10k.zsh


