{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.firewall.allowedTCPPorts = [ 1688 8000 ]; # vlmcsd
  networking.hostName = "naptop";
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  services.smartd.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
    smartmontools
    wget
  ];

  environment.variables.EDITOR = "nvim";
  programs.fish.enable = true;

  users.users.c31io = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = [
    "https://mirrors.cernet.edu.cn/nix-channels/store"
  ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}

