{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "path:/home/c31io/repo/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-matlab = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-matlab,
      ...
    }:
    let
      username = "c31io";
      system = "x86_64-linux";
      flake-overlays = [ nix-matlab.overlay ];
    in
    {
      nixosConfigurations.naptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./configuration.nix flake-overlays)
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = inputs;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${username}" = import ./home.nix;
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
          }
        ];
      };
    };
}
