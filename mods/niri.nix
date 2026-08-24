{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  services.libinput.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
      extraPackages = [ pkgs.sddm-astronaut ];
    };
    defaultSession = "niri";
  };

  environment.systemPackages = with pkgs; [
    alacritty
    bluetui
    brightnessctl
    fuzzel
    playerctl
    sddm-astronaut
    swaylock
    ungoogled-chromium
    waybar
    wl-clipboard
    xwayland-satellite
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
