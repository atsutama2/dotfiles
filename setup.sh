#!/bin/zsh

# シンボリックリンク
DOT_FILES=(.vimrc .zshrc .zprofile)
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# git設定
git config --local user.name "atsutama2"
git config --local user.email "atsutama.0713@gmail.com"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

#git remote set-url origin git@github.com:atsutama2/dotfiles.git
git remote set-url origin git@atsutama:atsutama2/dotfiles.git
