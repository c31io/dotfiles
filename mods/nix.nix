{ ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 1000000000;
    narinfo-cache-negative-ttl = 5;
    substituters = [ "http://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    trusted-users = [ "c31io" ];
  };
}