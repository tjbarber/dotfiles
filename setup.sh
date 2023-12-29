#!/usr/bin/env bash

# turns the platform into 'linux' or 'darwin'
platform=$(uname | tr '[:upper:]' '[:lower:]')

rm -f -- ~/.alacritty.yml
rm -f -- ~/.fonts
rm -f -- ~/work
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/sway
rm -rf -- ~/.config/gtk-3.0
rm -rf -- ~/.zshrc
rm -rf -- ~/.tmux.conf
rm -rf -- ~/Pictures/wallpapers

ln -s "$(pwd)/.alacritty.$platform.yml" ~/.alacritty.yml
ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/work" ~/work
ln -s "$(pwd)/wallpapers" ~/Pictures/wallpapers

if [ $platform == "linux" ]; then
  ln -s "$(pwd)/sway" ~/.config/sway
  ln -s "$(pwd)/fonts" ~/.fonts
  ln -s "$(pwd)/gtk-3.0" ~/.config/gtk-3.0
  
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  fc-cache
fi
