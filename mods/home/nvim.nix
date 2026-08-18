{ config, pkgs, ... }:

let
  link = import ./link.nix config;
in
{
  home.packages = with pkgs; [
    # NeoVim
    neovim
    stylua
    tree-sitter
    gcc
    gnumake
    lua-language-server
  ];

  xdg.configFile = {
    "nvim".source = link "nvim";
  };
}
