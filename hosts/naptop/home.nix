{ config, pkgs, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dots/${path}";
in
{
  programs = {
    direnv.enable = true;
    zoxide.enable = true;

    ssh.enable = true;
    ssh.matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
      };
    };

    vscode.enable = true;
  };

  home.packages = with pkgs; [
    # CLI
    bat eza fd htop lsof procs ripgrep
    git gh
    ghostscript
    unzip
    yt-dlp
    # NeoVim
    neovim tree-sitter wl-clipboard
    gcc gnumake lua-language-server
    # GUI
    alacritty
    calibre
    google-chrome
    gparted exfat
    libreoffice-qt
    obsidian
    telegram-desktop
    ventoy-full
    zotero
    # Develop
    devenv
    julia
    nodejs
    octaveFull
    python3
    racket
    # VM
    quickemu sambaFull spice-gtk
  ];

  xdg.configFile = {
    "alacritty".source = link "alacritty";
    "fish".source = link "fish";
    "nvim".source = link "nvim";
    "yt-dlp".source = link "yt-dlp";
    "git".source = link "git";
  };

  home.stateVersion = "23.11";
}
