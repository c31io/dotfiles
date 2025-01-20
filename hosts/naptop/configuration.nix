{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../mods/pc.nix
    ../../mods/kde.nix
  ];

  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "naptop";
  networking.firewall.allowedTCPPorts = [ 1688 8000 ]; # vlmcsd
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  services.dictd.enable = false; #TODO #368885
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };
  services.smartd.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = flake-overlays;
  environment.systemPackages = with pkgs; [ matlab ];
  system.stateVersion = "23.11";
}
