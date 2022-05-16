###############################################################
# .zshrc auther: atsutama2
###############################################################

setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
export PATH="/usr/local/sbin:$PATH"
#PROMPT='%F{green}%m@%n%f %F{cyan}%~%f$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# rbenv
#[[ -d ~/.rbenv  ]] && \
#  export PATH=${HOME}/.rbenv/bin:${PATH} && \
#  eval "$(rbenv init -)"

# プロンプト複数起動時のhistory共有
setopt share_history

# 重複するコマンドのhistory削除
setopt hist_ignore_all_dups

# コマンドのスペルミスの修正
setopt correct

# Command補完
autoload -Uz compinit && compinit

# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# anyenv
eval "$(anyenv init -)"

#direnv
eval "$(direnv hook zsh)"

# ----------------------------------------------------------------------------------------
# zsh-completions(補完機能)の設定
# ----------------------------------------------------------------------------------------
# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# 現在のブランチがupstreamより進んでいるとき">"を、遅れているとき"<"を、遅れてるけど独自の変更もあるとき"<>"を表示する
# addされてない新規ファイルがある(untracked)とき"%"を表示する
# stashになにか入っている(stashed)とき"$"を表示する
# addされてない変更(unstaged)があったとき"*"を表示する、addされているがcommitされていない変更(staged)があったとき"+"を表示する


# ----------------------------------------------------------------------------------------
# Python設定
# ----------------------------------------------------------------------------------------
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yuya.fujita/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yuya.fujita/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yuya.fujita/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yuya.fujita/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# ----------------------------------------------------------------------------------------
# alias設定
# ----------------------------------------------------------------------------------------
alias ll="ls -laF"
alias v="/usr/local/bin/vim"   # vim
alias his="history -Di | grep" # 引数でhistoryのgrepを行う
alias his="history -Di"
alias gcl="gcloud" #gcloud CLI

# rust
alias c="cargo"

# kubectl
alias k='kubectl'
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# ----------------------------------------------------------------------------------------
# zsh-completions(補完機能)の設定
# ----------------------------------------------------------------------------------------
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u


alias rm='rm -i'
alias v="/usr/bin/vim"
alias gg='git grep'
alias k='kubectl'
alias d='docker'

# C#
alias dotnetnew='dotnet new console' # dotonet run
