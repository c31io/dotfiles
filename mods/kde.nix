{ config, lib, pkgs, ... }:

{
  imports = [ ./cli.nix ];

  programs.kdeconnect.enable = true;

  networking.firewall = {
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };

  i18n = {
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.waylandFrontend = true;
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
    desktopManager.plasma6.enable = true;
    xserver.desktopManager.xterm.enable = false;
    xserver.xkb.options = "caps:swapescape";
    printing.enable = true;
    v2raya.enable = true;
  };

  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  environment.systemPackages = with pkgs; [
    alacritty
    firefox
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; } )
  ];
}
