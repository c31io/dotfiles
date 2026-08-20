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
    ../../mods/niri.nix
  ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "trilio";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = flake-overlays;

  services.flatpak.enable = true;

  system.stateVersion = "26.05";

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "Alacritty.desktop" ];
  };
}
