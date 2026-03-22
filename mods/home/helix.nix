{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "ayu_light";
      editor = {
        cursorline = true;
        lsp.display-inlay-hints = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      keys.normal.z = {
        a = ":xa";
        q = ":q!";
        w = ":w";
        x = ":x";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "rust";
        auto-format = true;
      }
    ];
  };
}
