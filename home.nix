{ pkgs, ... }: {
  programs = {
    fish.enable = true;
    ssh.enable = true;
    ssh.matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
      };
    };
    git = {
      enable = true;
      userName = "Celio Grand";
      userEmail = "celiogrand@outlook.com";
      includes = [];
    };
  };
  xdg.enable = true;
  xdg.configFile = {
    "fish".source = ./fish;
  };
  home.stateVersion = "23.11";
}
