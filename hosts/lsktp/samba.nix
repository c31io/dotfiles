{ ... }:

{
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      "Sync" = {
        "path" = "/home/c31io/Sync";
        "read only" = "no";
        "guest ok" = "no";
      };
    };
  };
}
