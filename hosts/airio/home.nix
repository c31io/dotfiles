{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/helix.nix
    ../../mods/home/develop.nix
  ];

  home.stateVersion = "25.11";
}
