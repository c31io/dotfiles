{
  config,
  lib,
  pkgs,
  ...
}:

{
  services = {
    xrdp = {
      defaultWindowManager = "xfce-session";
      enable = true;
      openFirewall = true;
    };
    xserver.desktopManager.xfce.enable = true;
  };
}
