{ lib, pkgs, ... }:

{
  config = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    services.dunst = {
      enable = true;

      settings.global = {
        monitor = 0;
      };
    };
  };
}
