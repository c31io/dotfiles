{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Shanghai";

  users.users.c31io = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ gh git neovim ];
  environment.variables.EDITOR = "nvim";
  networking.networkmanager.enable = true;
  programs.fish.enable = true;
  services.v2raya.enable = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "http://mirrors.cernet.edu.cn/nix-channels/store" ];
    trusted-users = [ "c31io" ];
  };
}
