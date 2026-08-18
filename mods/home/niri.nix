{ config, pkgs, ... }:

let
  link = import ./link.nix config;
in
{
  xdg.configFile = {
    "niri".source = link "niri";
    "waybar".source = link "waybar";
    "fuzzel".source = link "fuzzel";
  };
}
