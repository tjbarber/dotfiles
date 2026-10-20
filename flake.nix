{
  description = "tjthedev's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	mise.url = "github:jdx/mise/v2026.10.15";
  };

  outputs = { nixpkgs, home-manager, mise, ... }: {
    homeConfigurations.tjbarber =
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

		extraSpecialArgs = {
          misePackage = mise.packages.x86_64-linux.default;
        };

        modules = [ ./nix/home.nix ];
      };
  };
}
