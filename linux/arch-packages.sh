#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm \
  ghostty \
  rofi-wayland \
  zsh \
  ripgrep \
  git \
  pamixer \
  base-devel \
  rust \
  libffi \
  libyaml \
  openssl \
  zlib \
  thunar \
  thunar-volman \
  gvfs \
  tumbler \
  postgresql \
  valkey \
  xdg-desktop-portal \
  xdg-desktop-portal-wlr \
  xdg-desktop-portal-gtk \
  xdg-user-dirs \
  slurp \
  wl-clipboard \
  fzf \
  tmux \
  pipewire \
  wireplumber \
  ncspot \
  dunst \
  curl \
  cmake \
  ninja \
  flatpak \
  unzip \
  evemu

# dont forget to install gcc-14 to help compile annoying gems
# sudo pacman -S gcc14

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://install.ohmyz.sh)"
fi

if [ ! -d "$HOME/Projects/neovim" ]; then
  git clone git@github.com:neovim/neovim.git
fi

if [ -d "$HOME/Projects/neovim" ]; then
  git pull
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
fi

if [ ! -f "$HOME/.local/bin/mise" ]; then
  curl https://mise.run | sh
fi

if [ ! -f "/usr/bin/paru" ]; then
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
fi

paru -S --needed --noconfirm slack-desktop-wayland

xdg-settings set default-web-browser firefox.desktop

sudo systemctl enable valkey.service
sudo systemctl start valkey.service

flatpak install flathub md.obsidian.Obsidian

