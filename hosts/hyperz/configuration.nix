{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "hyperz";
  networking.networkmanager.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Shanghai";

  users.users.c31io = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ git neovim ];

  programs.fish.enable = true;
  services.openssh.enable = true;
  services.v2raya.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 2017 ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "http://mirrors.cernet.edu.cn/nix-channels/store" ];
    trusted-users = [ "c31io" ];
  };

  system.stateVersion = "24.05";
}
