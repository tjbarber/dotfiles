#!/usr/bin/env bash

rm -f -- ~/.fonts
rm -f -- ~/work
rm -rf -- ~/.config/nvim
rm -rf -- ~/.config/ghostty
rm -rf -- ~/.zshrc
rm -rf -- ~/.tmux.conf
rm -rf -- ~/.local/scripts

ln -s "$(pwd)/darwin/ghostty" ~/.config/ghostty

ln -s "$(pwd)/shared/nvim" ~/.config/nvim
ln -s "$(pwd)/shared/.zshrc" ~/.zshrc
ln -s "$(pwd)/shared/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/shared/work" ~/work
ln -s "$(pwd)/shared/scripts" ~/.local/scripts
