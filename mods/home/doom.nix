{ config, pkgs, ... }:

let
  link = import ./link.nix config;
in
{
  xdg.configFile = {
    "doom".source = link "doom";
  };
}
