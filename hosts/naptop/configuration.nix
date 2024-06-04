{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Shanghai";
  networking.hostName = "naptop";
  networking.firewall.allowedTCPPorts = [ 1688 8000 ]; # vlmcsd
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.c31io = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd"];
    shell = pkgs.fish;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
    trusted-users = [ "c31io" ];
  };
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}

