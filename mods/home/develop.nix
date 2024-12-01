{ config, pkgs, ... }:

let
  link = import ./link.nix config;
in
{
  programs = {
    direnv.enable = true;
    zoxide.enable = true;

    bat = {
      enable = true;
      config.theme = "Solarized (light)";
    };

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
    eza file fd htop lsof procs ripgrep
    tokei unzip
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
