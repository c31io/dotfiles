{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../mods/pc.nix
    ../../mods/kde.nix
  ];

  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "lsktp";
  networking.firewall.allowedTCPPorts = [
    1688
    8000
  ]; # vlmcsd
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  services.dictd.enable = false; # TODO #368885
  services.fail2ban.enable = true;
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    ports = [ 22222 ];
  };
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };
  services.smartd.enable = true;
  users.users.c31io.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqoyPCI1c/Jz+U9khyB4kPaiE0/4kq7ii/2/WHLIojV c31io"
  ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
