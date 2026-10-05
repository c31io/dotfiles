{
  config,
  lib,
  pkgs,
  ...
}:

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

    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "github.com" = {
          HostName = "ssh.github.com";
          Port = 443;
          User = "git";
        };
        "aur.archlinux.org" = {
          HostName = "aur.archlinux.org";
          IdentityFile = "~/.ssh/aur";
          User = "aur";
        };
      };
    };
  };

  home.packages =
    with pkgs;
    [
      # CLI
      btop
      htop
      procs
      eza
      file
      fish
      fd
      delta
      gitui
      lsof
      ripgrep
      tokei
      unzip
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      atop
      wl-clipboard
    ];

  services.lorri.enable = pkgs.stdenv.hostPlatform.isLinux;

  xdg.configFile = {
    "fish".source = link "fish";
    "git".source = link "git";
  };
}
