{ config, pkgs, ... }:

let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs = {
    zoxide.enable = true;

    ssh.enable = true;
    ssh.matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
      };
    };
  };

  home.packages = with pkgs; [
    alacritty
    bat
    eza
    fish
    gcc
    gh
    git
    gnumake
    neovim
    ripgrep
  ];

  home.file = {
    ".config/alacritty".source = link ./alacritty;
    ".config/fish".source = link ./fish;
    ".gitconfig".source = link ./git/.gitconfig;
    ".config/nvim".source = link ./nvim;
  };

  home.stateVersion = "23.11";
}
