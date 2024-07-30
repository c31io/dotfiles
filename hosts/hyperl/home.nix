{ config, pkgs, ... }:

{
  imports = [ ../../mods/home/develop.nix ];
  home.stateVersion = "24.05";
}
