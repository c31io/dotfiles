{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # doom
    git emacs ripgrep
    # doom optional
    coreutils fd clang
    # doom :lang
    discount shellcheck
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly"]; } )
    fira-sans
  ];
}
