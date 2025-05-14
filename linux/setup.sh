#!/usr/bin/env bash

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

ln -s "$(pwd)/linux/dunst" ~/.config/dunst
ln -s "$(pwd)/linux/ghostty" ~/.config/ghostty
ln -s "$(pwd)/linux/.fehbg" ~/.fehbg
# ln -s "$(pwd)/linux/i3" ~/.config/i3
ln -s "$(pwd)/linux/sway" ~/.config/sway
ln -s "$(pwd)/linux/gtk-3.0" ~/.config/gtk-3.0
ln -s "$(pwd)/linux/xfce4" ~/.config/xfce4

ln -s "$(pwd)/shared/fonts" ~/.fonts
ln -s "$(pwd)/shared/nvim" ~/.config/nvim
ln -s "$(pwd)/shared/.zshrc" ~/.zshrc
ln -s "$(pwd)/shared/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/shared/work" ~/work
ln -s "$(pwd)/shared/scripts" ~/.local/scripts

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
fc-cache
