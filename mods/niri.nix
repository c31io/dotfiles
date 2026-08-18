{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  hardware.graphics.enable = true;
  services.libinput.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "maldives";
    };
    defaultSession = "niri";
  };

  environment.systemPackages = with pkgs; [
    alacritty
    ungoogled-chromium
    wl-clipboard
    waybar
    fuzzel
    swaylock
    playerctl
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
