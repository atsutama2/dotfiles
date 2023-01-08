###############################################################
# .zshrc auther: atsutama2
###############################################################

setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
export PATH="/usr/local/sbin:$PATH"
USE_GKE_GCLOUD_AUTH_PLUGIN=True

#PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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


# ----------------------------------------------------------------------------------------
# zsh-completions(補完機能)の設定
# ----------------------------------------------------------------------------------------
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u


# ----------------------------------------------------------------------------------------
# alias設定
# ----------------------------------------------------------------------------------------
alias ll="ls -laF"
alias v="/usr/local/bin/nvim"
alias his="history -Di | grep" # 引数でhistoryのgrepを行う
alias his="history -Di"
alias gcl="gcloud" #gcloud CLI

# git
alias gcpa="git cherry-pick --abort"

# rust
alias c="cargo"

# kubectl
alias k='kubectl'
alias mk='minikube'
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

alias gg='git grep'
alias k='kubectl'
alias d='docker'

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

#. /usr/local/opt/asdf/asdf.sh
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
