#!/bin/bash

############################## System ##############################

# コンソールアプリケーションの画面サイズ変更を高速にする
printf "System - Faster screen resizing of console applications\n"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# ダイアログ表示やウィンドウリサイズ速度を高速化
printf "System - Increased dialog display and window resizing speed\n"
defaults write -g NSWindowResizeTime 0.1

# 保存ダイアログを詳細設定で表示
printf "System - Display save dialog with advanced settings\n"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true

# 拡張子を常に表示
printf "System - Always show extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#ネットワークストレージに.DS_Storeファイルを作成しない
printf "System - Do not create .DS_Store in network folder\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#スクロールバーの常時表示
printf "System - Always display scroll bar\n"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

#バッテリー残量を％表記に
printf "System - Battery level is expressed in percent\n"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

#日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
printf "System - Date and time format changes\n"
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

#ソフトウェアアップデートを無効化
printf "System - Disable software updates\n"
sudo softwareupdate --schedule off

############################## Finder ##############################

# Finderのパス表示をホームフォルダを基準にする
printf "Finder - Finder path display is based on home folder\n"
defaults write com.apple.finder PathBarRootAtHome -bool yes

# Finder のタイトルバーにフルパスを表示する
printf "Finder - Show filename extensions\n"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder で非表示ファイルを表示
printf "Finder - Show hidden files by default\n"
defaults write com.apple.finder AppleShowAllFiles -bool true

# ステータスバーを表示
printf "Finder - Show status bar\n"
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
printf "Finder - Show passbar\n"
defaults write com.apple.finder ShowPathbar -bool true

# 「ライブラリ」を常に表示
printf "Finder - Always show library\n"
chflags nohidden ~/Library

# フォルダを開くときのアニメーションを無効
printf "Finder - Disable animation when opening a folder\n"
defaults write com.apple.finder AnimateWindowZoom -bool false

# Finderのアニメーション効果を全て無効にする
printf "Finder - Disable all Finder animation effects\n"
defaults write com.apple.finder DisableAllAnimations -bool true

# ファインダーのアニメーションを削除
printf "Finder - Disable animation\n"
defaults write com.apple.finder AnimateInfoPanes -bool false;

# ファイルを開く際の警告ダイアログを無効にする
printf "Finder - Disable warning dialog when opening a file\n"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Finderの効果音を無効にする
printf "Finder - Disable Finder sound effects\n"
defaults write com.apple.finder FinderSounds -bool no

killall Finder

############################## Dock ##############################

# Dockへ起動中のアプリのみ表示
printf "Dock - Display only apps running in the Dock\n"
defaults write com.apple.dock static-only -boolean true

# 起動中のアプリケーションをアニメーション非表示
printf "Dock - Disable animation when starting application\n"
defaults write com.apple.dock launchanim -bool false

# Dockを自動的に非表示
printf "Dock - Hiding the Dock automatically\n"
defaults write com.apple.dock autohide -bool true

# Dockの位置を左側へ
printf "Dock - Move the Dock to the left\n"
defaults write com.apple.dock orientation -string "left"

# Dockの拡大OFF
printf "Dock - Dock expansion OFF\n"
defaults write com.apple.dock magnification -bool false

# Dockの表示・非表示を高速化
printf "Dock - Speed up the display,  non-display of the Dock \n"
defaults write com.apple.dock autohide-time-modifier -int 0

killall Dock

############################## Other ##############################
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabljed -bool false
