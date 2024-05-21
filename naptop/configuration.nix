{ config, lib, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.firewall = {
    allowedTCPPorts = [ 1688 8000 ]; # vlmcsd
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };
  networking.hostName = "naptop";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Shanghai";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
      ];
    };
  };

  services = {
    xserver.enable = true;
    libinput.enable = true;
    displayManager.sddm.enable = true;
    xserver.desktopManager.plasma5.enable = true;
    xserver.desktopManager.xterm.enable = false;
    xserver.xkb.options = "caps:swapescape";
    smartd.enable = true;
    printing.enable = true;
    v2raya.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    curl
    firefox
    fish
    neovim
    smartmontools
    wget
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  programs.fish.enable = true;

  users.users.c31io = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  home-manager.users.c31io = import ./home.nix;
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  nix.settings.substituters = [
    "https://mirrors.cernet.edu.cn/nix-channels/store"
  ];
  nixpkgs.config.allowUnfree = true;

  system.copySystemConfiguration = true;
  system.stateVersion = "23.11";
}

