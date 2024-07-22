{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
    wget
  ];

  environment.variables.EDITOR = "nvim";
  programs.fish.enable = true;
  networking.networkmanager.enable = true;
}
