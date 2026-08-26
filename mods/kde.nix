{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./fcitx5.nix
  ];

  programs.kdeconnect.enable = true;

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;

    libinput.enable = true;
    printing.enable = true;

    xserver = {
      enable = true;
      desktopManager.xterm.enable = false;
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
