# dotfiles
dotfiles for mac

参考：https://mykii.blog/m1-mac-setup/#i-4

## Preparation Initial Setting
Execute following command for installing `homebrew`: https://brew.sh/index_ja

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
anyenv install goenv
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
```

### goenv
```
# install可能Version
goenv install -l

# install
goenv install 1.18.0
goenv global 1.18.0
goenv rehash
goenv versions
which go
```

### nodenv
```
# install
anyenv install nodenv

# Version 確認
nodenv -v
```

### Node.js
```
# インストール可能なnodeのバージョンを表示
nodenv install -l

# example
nodenv rehash
nodenv global 16.15.0
node -v
```

### NeoVim
```
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/colors ~/.config/nvim
```

### vim-plug
```
:PlugInstall
```

### Color Scheme
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
    
## Mac トラックパッドで「3 本指のドラッグ」を有効にする
- Apple メニュー  >「システム設定」(または「システム環境設定」) の順に選択します。
- 「アクセシビリティ」をクリックします。
- 「ポインタコントロール」(または「マウスとトラックパッド」) をクリックします。
- 「トラックパッドオプション」ボタンをクリックします。
- 「ドラッグにトラックパッドを使用」(または「ドラッグを有効にする」) をオンにします。
- ポップアップメニューからドラッグ方法として「3 本指のドラッグ」を選択します。
- 「OK」をクリックします。
