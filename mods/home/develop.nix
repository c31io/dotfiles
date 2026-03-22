{ config, lib, pkgs, ... }:

let
  link = import ./link.nix config;
in
{
  programs = {
    direnv.enable = true;
    nh.enable = true;
    zoxide.enable = true;

    bat = {
      enable = true;
      config.theme = "Solarized (light)";
    };

    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "github.com" = {
          hostname = "ssh.github.com";
          port = 443;
          user = "git";
        };
        "aur.archlinux.org" = {
          hostname = "aur.archlinux.org";
          identityFile = "~/.ssh/aur";
          user = "aur";
        };
      };
    };
  };

  home.packages = with pkgs; [
    # CLI
    btop
    htop
    procs
    eza
    file
    fish
    fd
    lsof
    ripgrep
    tokei
    unzip
    # NeoVim
    neovim
    stylua
    tree-sitter
    gcc
    gnumake
    lua-language-server
    # Environment
    devenv
    # Vibe
    claude-code
    vscode
    code-cursor
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    atop
    wl-clipboard
  ];

  services.lorri.enable = pkgs.stdenv.hostPlatform.isLinux;

  xdg.configFile = {
    "fish".source = link "fish";
    "nvim".source = link "nvim";
    "git".source = link "git";
  };
}
