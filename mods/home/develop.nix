{ config, pkgs, ... }:

let
  link = import ./link.nix config;
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
}
