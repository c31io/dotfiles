{ config, lib, pkgs, ... }:

{
  services.smartd.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
    smartmontools
    wget
  ];

  environment.variables.EDITOR = "nvim";
  programs.fish.enable = true;
}
