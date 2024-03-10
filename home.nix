{ pkgs, ... }: {
  programs = {
    fish.enable = true;
    ssh = {
      enable = true;
      matchBlocks = {
      	"github.com" = {
      	  hostname = "ssh.github.com";
      	  port = 443;
      	  user = "git";
	};
      };
    };
    git = {
      enable = true;
      userName = "Celio Grand";
      userEmail = "celiogrand@outlook.com";
      includes = [];
    };
  };
  home.stateVersion = "23.11";
}
