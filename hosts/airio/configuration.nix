{ config, pkgs, ... }:

{
  imports = [ ../../mods/nix.nix ];
  networking.hostName = "airio";
  users.users.c31io = {
    name = "c31io";
    home = "/Users/c31io";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 6;
}
