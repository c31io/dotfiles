{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nix-matlab, ... }:
    nixosConfigurations = {
      naptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ../../mods/cli.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.c31io = import ./home.nix;
            home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}
