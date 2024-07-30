{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../pc.nix ../vm.nix ];
  networking.hostName = "hyperz";
  system.stateVersion = "24.05";
}
