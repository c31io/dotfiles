{ config, pkgs, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dots/${path}";
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
    bat eza fd htop lsof procs ripgrep
    git gh
    ghostscript
    neovim xclip tree-sitter
    yt-dlp
    # GUI
    calibre
    google-chrome
    libreoffice-qt
    obsidian
    telegram-desktop
    zotero
    # PL
    gcc
    gnumake
    nodejs
    python3
    racket
  ];

  xdg.configFile = {
    "alacritty".source = link "alacritty";
    "fish".source = link "fish";
    "nvim".source = link "nvim";
    "yt-dlp".source = link "yt-dlp";
    "../.gitconfig".source = link "git/.gitconfig";
  };

  home.stateVersion = "23.11";
}
