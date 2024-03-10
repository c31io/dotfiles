{ config, pkgs, ... }:

let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs = {
    zoxide.enable = true;
    ssh.enable = true;
    ssh.matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
      };
    };
    git = {
      enable = true;
      userName = "Celio Grand";
      userEmail = "celiogrand@outlook.com";
      includes = [];
    };
  };
  home.file = {
    ".config/fish".source = link ./fish;
  };
  home.stateVersion = "23.11";
}
