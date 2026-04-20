flake-overlays:

{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../mods/pc.nix
    ../../mods/kde.nix
    ../../mods/distrobox.nix
  ];

  boot.supportedFilesystems = [ "bcachefs" "kvm-intel" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  virtualisation.libvirtd.enable = true;

  networking.hostName = "naptop";
  networking.firewall.allowedTCPPorts = [
    1688
    8000
  ]; # vlmcsd

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.dictd.enable = false; # TODO #368885
  services.smartd.enable = true;

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = flake-overlays;
  environment.systemPackages = with pkgs; [
    linuxPackages_latest.cpupower
  ];

  system.stateVersion = "23.11";
}
