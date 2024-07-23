{ config, pkgs, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dots/${path}";
in
{
  programs = {
    direnv.enable = true;
    zoxide.enable = true;

    ssh = {
      enable = true;
      matchBlocks = {
        "github.com" = {
          hostname = "ssh.github.com";
          port = 443;
          user = "git";
        };
      };
    };

    yt-dlp = {
      enable = true;
      settings = {
        ignore-errors = true;
        output = "~/youtube/%(playlist)s/%(playlist_index)s\\ -\\ %(title)s.%(ext)s";
        write-sub = true;
        write-auto-sub = true;
        sub-langs = "en.\\*";
        format = "bestvideo[ext=webm][width<2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<2000][height<=1200]+bestaudio/best[width<2000][height<=1200]/best";
      };
    };
  };

  home.packages = with pkgs; [
    # CLI
    bat eza fd htop lsof procs ripgrep
    unzip
    # NeoVim
    neovim stylua tree-sitter wl-clipboard
    gcc gnumake lua-language-server
    # Develop
    devenv
  ];

  xdg.configFile = {
    "fish".source = link "fish";
    "nvim".source = link "nvim";
    "git".source = link "git";
  };

  home.stateVersion = "24.05";
}
