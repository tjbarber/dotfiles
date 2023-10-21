#!/usr/bin/env bash

# turns the platform into 'linux' or 'darwin'
platform=$(uname | tr '[:upper:]' '[:lower:]')

rm -f -- ~/.alacritty.yml
rm -f -- ~/.fonts
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/i3
rm -rf -- ~/.config/sway
rm -rf -- ~/.config/polybar
rm -rf -- ~/.config/rofi
rm -rf -- ~/.config/gtk-3.0
rm -rf -- ~/.zshrc

ln -s "$(pwd)/.alacritty.$platform.yml" ~/.alacritty.yml
ln -s "$(pwd)/.config/nvim" ~/.config/nvim
ln -s "$(pwd)/.zshrc" ~/.zshrc

if [ $platform == "linux" ]; then
  if [ $XDG_SESSION_TYPE == "wayland" ]; then
    ln -s "$(pwd)/.config/sway" ~/.config/sway
  else
    ln -s "$(pwd)/.config/polybar" ~/.config/polybar
    ln -s "$(pwd)/.config/rofi" ~/.config/rofi
    ln -s "$(pwd)/.config/i3" ~/.config/i3
  fi

  ln -s "$(pwd)/.fonts" ~/.fonts
  ln -s "$(pwd)/.config/gtk-3.0" ~/.config/gtk-3.0
  
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  fc-cache
fi
