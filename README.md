# dotfiles
dotfiles for mac

参考：　https://mykii.blog/m1-mac-setup/#i-4

## Preparation
Execute following command for installing `homebrew`:<br>

## Initial Setting
HomeBrew：https://brew.sh/index_ja

```
xcode-select --install
```

## Rosetta2のインストール
```
sudo softwareupdate --install-rosetta
```

## Install
Execute following commands:
```
$ git clone https://github.com/atsutama2/dotfiles.git
$ cd ~/dotfiles
./setup.sh
```

### Mac Font
- Size: Ricty Regular 20

### anyenv
```
# プラグインをインストールする
anyenv install --init

# install list
anyenv install -l

# example
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
```

### NeoVim
```
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/colors ~/.config/nvim

pip3 install --user pynvim
pip3 install --user neovim
```

- vim-plug
```
:PlugInstall
```

- Color Scheme
```
mkdir ~/.config/nvim/color
cp .vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.config/nvim/color
```

### Terminal
- Setting tab shortcuts
  - システム環境設定→キーボード→ショートカット
  - アプリケーション→ターミナル.app
  - 次のタブを表示： command + 右Key
  - 前のタブを表示： command + 左Key

## VSCode
- Setting file
  - `/Users/[UserName]/Library/Application\ Support/Code/User/ `
  - vscode_settings.json → setting.json
- ショートカット
  - 参照へ移動
    - ctrl + r
  - 定義へ移動
    - ctrl + ]
  - 前に戻る
    - ctrl + [
