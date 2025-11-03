{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.kdeconnect.enable = true;

  i18n = {
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [
        qt6Packages.fcitx5-chinese-addons
        fcitx5-mozc
      ];
    };
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;

    libinput.enable = true;
    printing.enable = true;

    xserver = {
      enable = true;
      desktopManager.xterm.enable = false;
      xkb.options = "caps:swapescape";
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
    alacritty
    ungoogled-chromium
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
