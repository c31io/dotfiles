{ config, pkgs, ... }:

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

  environment.systemPackages = with pkgs; [
    gh
    git
    helix
  ];

  environment.variables.EDITOR = "hx";
  networking.networkmanager.enable = true;
  programs.fish.enable = true;
  services.journald.storage = "volatile";
  #services.v2raya.enable = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 1000000000;
    narinfo-cache-negative-ttl = 5;
    substituters = [ "http://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    trusted-users = [ "c31io" ];
  };
}
