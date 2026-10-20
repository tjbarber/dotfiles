{
  programs.ghostty = {
    enable = true;

    # Keep using your installed /usr/bin/ghostty for now.
    package = null;
    systemd.enable = false;

    settings = {
      gtk-titlebar = false;
      gtk-custom-css = "./gtk.css";
      window-decoration = false;

      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;
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
    };
  };

  xdg.configFile."ghostty/gtk.css".source =
    ../linux/ghostty/gtk.css;

  xdg.configFile."ghostty/themes/miami-nights".source =
    ../linux/ghostty/themes/miami-nights;
}
