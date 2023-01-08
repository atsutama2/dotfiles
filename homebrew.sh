#!/bin/bash

# mas-cliのインストール
printf "Installation of mas-cli\n"
brew install mas

# パッケージをインストール
printf "Installation of homebrew package\n"
sudo chown -R $(whoami) $(brew --prefix)/*
brew bundle

