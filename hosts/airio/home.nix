{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/helix.nix
    ../../mods/home/develop.nix
  ];

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    package = pkgs.ghostty-bin;
    settings = {
      theme = "Ayu Light";
    };
  };

  home.stateVersion = "25.11";
}
