#!/usr/bin/env bash

rm -f -- ~/.alacritty.yml
rm -f -- ~/.fonts
rm -f -- ~/.config/nvim
ln -s "$(pwd)/.alacritty.yml" ~/.alacritty.yml
ln -s "$(pwd)/.fonts" ~/.fonts
ln -s "$(pwd)/.config/nvim" ~/.config/nvim
