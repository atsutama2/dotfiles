#!/bin/zsh

./mac-defaults.sh
./homebrew.sh
#./install-vscode-extensions.sh

# シンボリックリンク
DOT_FILES=(.vimrc .zshrc .zprofile)
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# git設定
#git config --global user.name "atsutama2"
#git config --global user.email "atsutama.0713@gmail.com"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

#git remote set-url origin git@github.com:atsutama2/dotfiles.git
#git remote set-url origin git@atsutama:atsutama2/dotfiles.git

# git-prompt / git-completion
mkdir ~/.zsh
cd ~/.zsh
curl -o git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~/
exec $SHELL -l
