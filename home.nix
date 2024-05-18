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
    # CLI
    alacritty fish
    bat eza htop lsof procs ripgrep
    git gh
    ghostscript
    neovim xclip tree-sitter
    # GUI
    calibre
    google-chrome
    kdeconnect
    libreoffice-qt
    telegram-desktop
    zotero
    # PL
    gcc
    gnumake
    nodejs
    python3
    racket
  ];

  home.file = {
    ".config/alacritty".source = link ./alacritty;
    ".config/fish".source = link ./fish;
    ".gitconfig".source = link ./git/.gitconfig;
    ".config/nvim".source = link ./nvim;
  };

  home.stateVersion = "23.11";
}
