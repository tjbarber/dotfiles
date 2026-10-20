{ lib, pkgs, ... }:

{
  config = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    services.gammastep = {
      enable = true;

      temperature = {
        day = 6500;
        night = 3800;
      };

      dawnTime = "6:00-7:45";
      duskTime = "18:35-20:15";

      settings = {
        general = {
          adjustment-method = "wayland";
          fade = 1;
          gamma = 1.0;
          brightness = 1.0;
        };

        wayland.output = "*";
      };
    };
  };
}
