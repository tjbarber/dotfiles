#!/usr/bin/env bash

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

rm -f -- ~/.fonts
rm -f -- ~/work
rm -rf -- ~/.config/ghostty
rm -rf -- ~/.config/skhd
rm -rf -- ~/.config/nvim
rm -rf -- ~/.zshrc
rm -rf -- ~/.tmux.conf
rm -rf -- ~/.aerospace.toml
rm -rf -- ~/.local/scripts

ln -s "$(pwd)/darwin/ghostty" ~/.config/ghostty
ln -s "$(pwd)/darwin/.aerospace.toml" ~/.aerospace.toml
ln -s "$(pwd)/shared/skhd" ~/.config/skhd
ln -s "$(pwd)/shared/nvim" ~/.config/nvim
ln -s "$(pwd)/shared/.zshrc" ~/.zshrc
ln -s "$(pwd)/shared/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/shared/work" ~/work
ln -s "$(pwd)/shared/scripts" ~/.local/scripts

cp -a "$(pwd)/shared/fonts/." ~/Library/Fonts/

if ! which brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"	
  echo >> /Users/tjbarber/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tjbarber/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://install.ohmyz.sh)"
fi

if [ ! -d "" ]; then
    if [ ! -d "$HOME/Library/LaunchAgents" ]; then
      mkdir "$HOME/Library/LaunchAgents"
    fi

    cp "$(pwd)/darwin/com.nikitabobko.aerospace.plist" "$HOME/Library/LaunchAgents/com.nikitabobko.aerospace.plist"
    if ! launchctl list | grep -q aerospace; then
      launchctl load "$HOME/Library/LaunchAgents/com.nikitabobko.aerospace.plist"
    fi
fi

# Keyboard Shortcuts

# disable current Spotlight shortcut (Cmd+Space)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '<dict><key>enabled</key><false/></dict>'

# set Cmd+D for Spotlight search
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>100</integer><integer>2</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'

# treat all keyboards as ANSI keyboards
# defaults write /Library/Preferences/com.apple.keyboardtype -dict-add keyboardtype -int 40

# displays dont have separate workspaces
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

