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
    ../../mods/rdp.nix
    ../../mods/distrobox.nix
    ./samba.nix
  ];

  boot.supportedFilesystems = [
    "bcachefs"
    "ntfs"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/data" = {
    device = "/dev/disk/by-partuuid/9cd1f0b8-bc81-4dc3-ad8a-37a0e9410a0d";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=c31io"
      "gid=users"
      "umask=0022"
    ];
  };

  networking = {
    hostName = "lsktp";
    networkmanager = {
      enable = true;
      dispatcherScripts = [ { source = ./ddns.sh; } ];
    };
  };

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
