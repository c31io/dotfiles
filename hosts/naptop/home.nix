{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/develop.nix
    ../../mods/home/yt-dlp.nix
  ];

  programs = {
    vscode.enable = true;

    alacritty = {
      enable = true;
      settings = {
        colors.primary.background = "#fcfcfc";
        colors.primary.foreground = "#5c6166";
        env.TERM = "alacritty";
        font = {
          size = 11;
          normal.family = "JetBrainsMonoNLNerdFontMono";
        };
        keyboard.bindings = [
          {
            key = "F11";
            action = "ToggleFullscreen";
          }
        ];
        mouse.hide_when_typing = true;
      };
    };
  };

  home.packages = with pkgs; [
    # CLI
    pandoc texlive.combined.scheme-medium
    smartmontools unison
    # GUI
    bitwarden
    calibre
    fractal
    google-chrome
    gparted exfat
    thunderbird
    tuxguitar
    libreoffice-qt-still
    musescore
    remmina
    telegram-desktop
    ventoy
    # Programming
    octaveFull
    python3
    nodejs_latest
  ];

  home.stateVersion = "23.11";
}
