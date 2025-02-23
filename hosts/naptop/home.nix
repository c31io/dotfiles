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
    # CLI
    graphviz
    pandoc
    texlive.combined.scheme-medium
    smartmontools
    unison
    baidupcs-go
    # GUI
    bitwarden
    calibre
    discord
    fractal
    google-chrome
    gparted
    exfat
    thunderbird
    tuxguitar
    libreoffice-qt-still
    mpv
    musescore
    qbittorrent-enhanced
    remmina
    telegram-desktop
    ungoogled-chromium
    ventoy
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
