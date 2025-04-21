#!/usr/bin/env bash

# This is where secret ENV vars go
touch secrets.sh

rm -f -- ~/.fonts
rm -f -- ~/work
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/ghostty
rm -rf -- ~/.zshrc
rm -rf -- ~/.tmux.conf
rm -rf -- ~/.local/scripts
rm -rf -- ~/Pictures/wallpapers

ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/ghostty" ~/.config/ghostty
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/work" ~/work
ln -s "$(pwd)/scripts" ~/.local/scripts
