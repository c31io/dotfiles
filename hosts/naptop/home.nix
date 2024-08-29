{ config, pkgs, ... }:

{
  imports = [
    ../../mods/home/develop.nix
    ../../mods/home/doom.nix
    ../../mods/home/yt-dlp.nix
  ];

  programs = {
    vscode.enable = true;

    alacritty = {
      enable = true;
      settings = {
        colors.primary.background = "#002020";
        keyboard.bindings = [
          {
            key = "F11";
            action = "ToggleFullscreen";
          }
        ];
        env.TERM = "alacritty";
        font = {
          size = 11;
          normal.family = "JetBrainsMonoNLNerdFontMono";
        };
        window.opacity = 0.8;
      };
    };
  };

  home.packages = with pkgs; [
    # CLI
    ghostscript smartmontools
    # GUI
    calibre
    google-chrome
    gparted exfat
    libreoffice-qt-still
    telegram-desktop
    ventoy
    zotero
    # Programming
    octaveFull
    python3
    # VM
    quickemu sambaFull spice-gtk
  ];

  home.stateVersion = "23.11";
}
