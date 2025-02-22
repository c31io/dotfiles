{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "ayu_light";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      }
      {
        name = "rust";
        auto-format = true;
      }
    ];
  };
}
