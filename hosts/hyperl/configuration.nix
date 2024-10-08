{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../mods/pc.nix
    ../../mods/vm-client.nix
    ../../mods/wiki-js.nix
  ];

  networking.hostName = "hyperl";
  system.stateVersion = "24.05";
}
