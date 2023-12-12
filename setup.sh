#!/usr/bin/env bash

# turns the platform into 'linux' or 'darwin'
platform=$(uname | tr '[:upper:]' '[:lower:]')

rm -f -- ~/.alacritty.yml
rm -f -- ~/.fonts
rm -f -- ~/work
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/i3
rm -rf -- ~/.config/sway
rm -rf -- ~/.config/polybar
rm -rf -- ~/.config/rofi
rm -rf -- ~/.config/gtk-3.0
rm -rf -- ~/.config/helix
rm -rf -- ~/.config/kitty
rm -rf -- ~/.zshrc
rm -rf -- ~/.tmux.conf

ln -s "$(pwd)/.alacritty.$platform.yml" ~/.alacritty.yml
ln -s "$(pwd)/kitty" ~/.config/kitty
ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/helix" ~/.config/helix
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/work" ~/work

if [ $platform == "linux" ]; then
  if [ $XDG_SESSION_TYPE == "wayland" ]; then
    ln -s "$(pwd)/sway" ~/.config/sway
  else
    ln -s "$(pwd)/polybar" ~/.config/polybar
    ln -s "$(pwd)/rofi" ~/.config/rofi
    ln -s "$(pwd)/i3" ~/.config/i3
  fi

  ln -s "$(pwd)/fonts" ~/.fonts
  ln -s "$(pwd)/gtk-3.0" ~/.config/gtk-3.0
  
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  fc-cache
fi
