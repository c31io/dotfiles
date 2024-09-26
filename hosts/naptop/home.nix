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
        colors.primary.background = "#002020";
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
        window.opacity = 0.8;
      };
    };
  };

  home.packages = with pkgs; [
    # CLI
    ghostscript smartmontools
    # GUI
    bitwarden
    calibre
    fractal
    google-chrome
    gparted exfat
    libreoffice-qt-still
    remmina
    telegram-desktop
    ventoy
    # Programming
    octaveFull
    python3
  ];

  home.stateVersion = "23.11";
}
