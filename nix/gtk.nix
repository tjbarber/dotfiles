{ lib, pkgs, ... }:

{
	config = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
		gtk = {
			enable = true;

			gtk2.enable = false;
			gtk4.enable = false;

			gtk3.extraConfig = {
				gtk-application-prefer-dark-theme= true;
			};
		};
	};
}
