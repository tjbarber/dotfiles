{ pkgs, ... }:

{
	fonts.fontconfig.enable = true;

	home.packages = [
		pkgs.nerd-fonts.jetbrains-mono
		pkgs.cozette
		pkgs.font-awesome_5
	];
}
