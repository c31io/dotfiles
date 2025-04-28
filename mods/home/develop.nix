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

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        editor = {
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          cursorline = true;
          lsp.display-inlay-hints = true;
        };
        theme = "ayu_light";
      };
    };

    ssh = {
      enable = true;
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
    atop
    btop
    htop
    procs
    eza
    file
    fd
    lsof
    ripgrep
    tokei
    unzip
    # NeoVim
    neovim
    stylua
    tree-sitter
    wl-clipboard
    gcc
    gnumake
    lua-language-server
    # Develop
    devenv
  ];

  services.lorri.enable = true;

  xdg.configFile = {
    "fish".source = link "fish";
    "nvim".source = link "nvim";
    "git".source = link "git";
  };
}
