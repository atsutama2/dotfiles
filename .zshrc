###############################################################
# .zshrc auther: yuya fujita <yuyafujita.eng@mail.com>        #
###############################################################

PROMPT='%F{green}%m@%n%f %F{cyan}%~%f$ '
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

# ----------------------------------------------------------------------------------------
# Python設定
# ----------------------------------------------------------------------------------------
# >>> conda initialize >>>
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
# <<< conda initialize <<<


# ----------------------------------------------------------------------------------------
# alias設定
# ----------------------------------------------------------------------------------------
alias ll="ls -laF"
alias v="/usr/local/bin/vim"   # vim
alias his="history -Di | grep" # 引数でhistoryのgrepを行う
alias history="history -Di"
alias gi="git ci -am"          # add,commit 同時実行


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

# C#
alias dotnetnew='dotnet new console' # dotonet run
