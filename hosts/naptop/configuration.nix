flake-overlays:
{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../mods/pc.nix
  ];

  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "naptop";
  networking.firewall.allowedTCPPorts = [ 1688 8000 ]; # vlmcsd
  services.smartd.enable = true;
  nixpkgs.overlays = flake-overlays;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
