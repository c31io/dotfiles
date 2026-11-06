{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/alacritty.nix
    ../../mods/home/develop.nix
    ../../mods/home/fish.nix
    ../../mods/home/helix.nix
    ../../mods/home/niri.nix
    ../../mods/home/yt-dlp.nix
  ];

  home.packages = with pkgs; [
    feishu
    freerouting
    glab
    kicad
    mpv
    nodejs
    omp
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "26.05";
}
