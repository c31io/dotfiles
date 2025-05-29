{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/alacritty.nix
    ../../mods/home/develop.nix
    ../../mods/home/helix.nix
    ../../mods/home/plasma.nix
    ../../mods/home/yt-dlp.nix
  ];

  programs = {
    vscode.enable = true;
  };

  home.packages = with pkgs; [
    # CLI
    graphviz
    pandoc
    texlive.combined.scheme-medium
    tmux
    smartmontools
    unison
    # GUI
    bitwarden
    calibre
    discord
    fractal
    #gitbutler
    google-chrome
    gparted
    exfat
    thunderbird
    libreoffice-qt-still
    qbittorrent-enhanced
    remmina
    #ventoy
    zotero
    # Programming
    nixfmt-rfc-style
    nodejs_latest
    octaveFull
    python3
    rustup
  ];

  home.stateVersion = "23.11";
}
