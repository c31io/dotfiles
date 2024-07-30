{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../pc.nix ../vm.nix ];
  networking.hostName = "hyperl";
  system.stateVersion = "24.05";
}
