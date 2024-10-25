{ config, lib, pkgs, ... }:

let
  indexPage = pkgs.writeTextDir "index.html" ''
      <!DOCTYPE html>
      <html>
      <head>
          <title>c31io's LAN Server</title>
      </head>
      <body>
          <h1>c31io's LAN Server</h1>
          <p>Basically, there are two services.</p>
          <h2><a href="http://l-wiki.c31.io">L-Wiki</a></h2>
          <p>If you want to edit, I'll give you an account.</p>
          <h2><a href="http://l-chat.c31.io">L-Chat</a></h2>
          <p>MANY AI chat bots, ask me for access.</p>
      </body>
      </html>
  '';
in
{
  imports = [
    ./hardware-configuration.nix
    ../../mods/pc.nix
    ../../mods/vm-client.nix
    ../../mods/wiki-js.nix
  ];

  services.nginx =  {
    enable = true;
    virtualHosts = {
      "l.c31.io" =  {
        root = indexPage;
      };

      "l-wiki.c31.io" =  {
        locations."/" = {
          proxyPass = "http://127.0.0.1:3000/";
        };
      };

      "l-chat.c31.io" =  {
        locations."/" = {
          proxyPass = "http://127.0.0.1:3080/";
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
  networking.hostName = "hyperl";
  system.stateVersion = "24.05";

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.systemPackages = with pkgs; [
    podman-compose
  ];
}
