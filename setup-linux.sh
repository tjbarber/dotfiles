#!/usr/bin/env bash

# This is where secret ENV vars go
touch secrets.sh

rm -f -- ~/.fonts
rm -f -- ~/work
rm -rf -- ~/.config/dunst
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/sway
rm -rf -- ~/.config/i3
rm -rf -- ~/.config/gtk-3.0
rm -rf -- ~/.config/xfce4
rm -rf -- ~/.config/ghostty
rm -rf -- ~/.zshrc
rm -rf -- ~/.fehbg
rm -rf -- ~/.tmux.conf
rm -rf -- ~/.local/scripts

ln -s "$(pwd)/dunst" ~/.config/dunst
ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/ghostty" ~/.config/ghostty
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/.fehbg" ~/.fehbg
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/work" ~/work
ln -s "$(pwd)/scripts" ~/.local/scripts

ln -s "$(pwd)/i3" ~/.config/i3
ln -s "$(pwd)/sway" ~/.config/sway
ln -s "$(pwd)/fonts" ~/.fonts
ln -s "$(pwd)/gtk-3.0" ~/.config/gtk-3.0
ln -s "$(pwd)/xfce4" ~/.config/xfce4

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
fc-cache
