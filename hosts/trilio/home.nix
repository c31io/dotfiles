{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/alacritty.nix
    ../../mods/home/develop.nix
    ../../mods/home/fish.nix
    ../../mods/home/helix.nix
    ../../mods/home/niri.nix
    ../../mods/home/nvim.nix
    ../../mods/home/yt-dlp.nix
  ];

  home.stateVersion = "26.05";
}
