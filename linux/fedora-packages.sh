#!/usr/bin/env bash

# MAKE SURE YOU UPDATE THE SYSTEM AND REBOOT BEFORE YOU RUN THIS

sudo dnf copr enable scottames/ghostty

sudo dnf install \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
	flatpak \
	ninja-build \
	cmake \
	gcc \
	make \
	gettext \
	curl \
	glibc-gconv-extra \
	ghostty \
	xprop \
	zsh \
	fzf \
	autoconf \
	gcc \
	rust \
	patch \
	make \
	bzip2 \
	openssl-devel \
	libyaml-devel \
	libffi-devel \
	readline-devel \
	gdbm-devel \
	ncurses-devel \
	perl-FindBin \
	zlib-ng-compat-devel \
	rust \
	cargo \
	zsh \
	libpq-devel \
	ripgrep

sudo dnf install akmod-nvidia

# see https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo dnf install postgresql16 \
  postgresql16-server \
  postgresql16-contrib \
  valkey 

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://install.ohmyz.sh)"
fi

# if [ ! -d "$HOME/Projects/neovim" ]; then
#   git clone git@github.com:neovim/neovim.git
# fi

if [ ! -f "$HOME/.local/bin/mise" ]; then
  curl https://mise.run | sh
fi

# sudo systemctl enable valkey.service
# sudo systemctl start valkey.service

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.slack.Slack

cargo install --locked ncspot

echo -n > "$HOME/.config/sway/config.d/90-bar.conf"

