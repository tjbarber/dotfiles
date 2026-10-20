{ lib, pkgs, ... }:

let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
{
  programs.ghostty = {
    enable = true;

    # Keep using your installed /usr/bin/ghostty for now.
	# REMOVE THESE WHEN WE'RE ON NIXOS
    package = null;
    systemd.enable = false;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = if isDarwin then 20 else 14;

      window-padding-x = 20;
      window-padding-y = 20;

      shell-integration-features = "no-cursor";
      cursor-style = "block";
      cursor-style-blink = false;
      theme = "miami-nights";
      confirm-close-surface = false;

      keybind = [
        "super+shift+f=toggle_fullscreen"
        "super+shift+y=decrease_font_size:1"
        "super+shift+i=increase_font_size:1"
        "super+shift+u=reset_font_size"
      ];
     } // lib.optionalAttrs isLinux {
		gtk-titlebar = false;
		gtk-custom-css = "./gtk.css";
		window-decoration = false;
    };
  };

  xdg.configFile."ghostty/gtk.css" = lib.mkIf isLinux {
    source = ../linux/ghostty/gtk.css;
  };

  xdg.configFile."ghostty/themes/miami-nights".source =
    ../linux/ghostty/themes/miami-nights;
}
