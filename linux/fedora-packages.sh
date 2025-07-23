#!/usr/bin/env bash

# MAKE SURE YOU UPDATE THE SYSTEM AND REBOOT BEFORE YOU RUN THIS

sudo dnf copr enable scottames/ghostty

sudo dnf install \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
	flatpak \
	ninja-build \
	cmake \
	gcc \
	make \
	gettext \
	curl \
	glibc-gconv-extra \
	ghostty \
	gnome-shell-extension-pop-shell \
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
	ncspot

sudo dnf install akmod-nvidia

sudo dnf install postgresql@16

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://install.ohmyz.sh)"
fi

if [ ! -d "$HOME/Projects/neovim" ]; then
  git clone git@github.com:neovim/neovim.git
fi

if [ ! -f "$HOME/.local/bin/mise" ]; then
  curl https://mise.run | sh
fi

# sudo systemctl enable valkey.service
# sudo systemctl start valkey.service

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.slack.Slack

cargo install --locked ncspot
