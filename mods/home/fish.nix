{ config, pkgs, ... }:

let
  link = import ./link.nix config;
in
{
  xdg.configFile = {
    "fish".source = link "fish";
  };
}
