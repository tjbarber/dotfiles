#!/usr/bin/env bash

rm -f -- ~/.alacritty.yml
rm -f -- ~/.fonts
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/i3
rm -rf -- ~/.config/polybar
rm -rf -- ~/.config/rofi
rm -rf -- ~/.config/gtk-3.0

ln -s "$(pwd)/.alacritty.yml" ~/.alacritty.yml
ln -s "$(pwd)/.fonts" ~/.fonts
ln -s "$(pwd)/.config/nvim" ~/.config/nvim
ln -s "$(pwd)/.config/i3" ~/.config/i3
ln -s "$(pwd)/.config/polybar" ~/.config/polybar
ln -s "$(pwd)/.config/rofi" ~/.config/rofi
ln -s "$(pwd)/.config/gtk-3.0" ~/.config/gtk-3.0

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
