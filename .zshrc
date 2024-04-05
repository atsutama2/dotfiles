###############################################################
# .zshrc auther: atsutama2
###############################################################

# setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
setopt PROMPT_SUBST ; PS1='%F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '

export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/bin/
USE_GKE_GCLOUD_AUTH_PLUGIN=True

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# gcloud 3.12はNG
export CLOUDSDK_PYTHON="/opt/homebrew/bin/python3.10"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

#direnv
eval "$(direnv hook zsh)"

# zlib
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
  export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# rbenv
eval "$(rbenv init - zsh)"

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

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
#alias v="/usr/local/bin/nvim"
alias v="/opt/homebrew/bin/nvim"
alias his="history -Di"
alias gcl="gcloud" #gcloud CLI
alias sto="open /Applications/SourceTree.app/Contents/MacOS/SourceTree"
alias coverhtml="go tool cover -html=coverage.out -o coverage.html"
alias mysql-lab-connect="cloud-sql-proxy --port 3306 vlive-lab:asia-northeast1:vlive-lab-1"
alias ios-test='(){make unit-test TEST_CLASS=$1 TEST_METHOD=$2}'

# android
ANDROID_HOME='/Applications/Android Studio.app'
export PATH=$PATH:/Users/yuya.fujita/Library/Android/sdk/platform-tools

# git
alias g="git"
alias gcpa="git cherry-pick --abort"

# rust
alias c="cargo"

# kubectl
alias k='kubectl'
alias mk='minikube'
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

alias k='kubectl'
alias d='docker'

#. /usr/local/opt/asdf/asdf.sh
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuya.fujita/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuya.fujita/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuya.fujita/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuya.fujita/google-cloud-sdk/completion.zsh.inc'; fi
