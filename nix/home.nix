{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./mise.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tjbarber";
  home.homeDirectory = "/home/tjbarber";

  home.packages = [
	pkgs.fzf
	pkgs.ripgrep
	pkgs.neovim
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
