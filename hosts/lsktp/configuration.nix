flake-overlays:

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
    ./samba.nix
  ];

  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "lsktp";

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.dictd.enable = false; # TODO #368885
  services.smartd.enable = true;

  services.fail2ban.enable = true;
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    ports = [ 22222 ];
  };
  users.users.c31io.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqoyPCI1c/Jz+U9khyB4kPaiE0/4kq7ii/2/WHLIojV c31io"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = flake-overlays;
  environment.systemPackages = with pkgs; [ matlab ];

  system.stateVersion = "24.11";
}
