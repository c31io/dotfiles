{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # doom
    git emacs ripgrep
    # doom optional
    coreutils fd clang
  ];
}
