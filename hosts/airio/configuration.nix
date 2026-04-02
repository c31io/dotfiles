{ config, pkgs, ... }:

{
  imports = [ ../../mods/nix.nix ];

  networking.hostName = "airio";

  users.users.c31io = {
    name = "c31io";
    home = "/Users/c31io";
    shell = pkgs.fish;
  };

  environment.variables.EDITOR = "hx";

  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 6;
  system.keyboard = {
    enableKeyMapping = true;
    swapLeftCtrlAndFn = true;
  };
}
