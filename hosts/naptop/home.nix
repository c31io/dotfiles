{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/alacritty.nix
    ../../mods/home/develop.nix
    ../../mods/home/plasma.nix
    ../../mods/home/yt-dlp.nix
  ];

  programs = {
    vscode.enable = true;
  };

  home.packages = with pkgs; [
    # System
    exfat
    smartmontools
    #ventoy
    # CLI
    graphviz
    pandoc
    texlive.combined.scheme-medium
    unison
    baidupcs-go
    # GUI
    bitwarden
    calibre
    discord
    fractal
    google-chrome
    gparted
    thunderbird
    tuxguitar
    libreoffice-qt-still
    mpv
    musescore
    qbittorrent-enhanced
    remmina
    telegram-desktop
    ungoogled-chromium
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
