{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./nix.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Shanghai";

  users.users.c31io = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "kvm"
    ];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    gh
    git
    helix
  ];

  environment.variables.EDITOR = "hx";
  networking.networkmanager.enable = true;

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
  };

  programs.fish.enable = true;
  services.journald.storage = "volatile";
  #services.v2raya.enable = true;
  services.xserver.xkb.options = "terminate:ctrl_alt_bksp,caps:swapescape";
}
