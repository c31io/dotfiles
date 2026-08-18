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
    opencode
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "26.05";
}
