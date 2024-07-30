{ config, pkgs, ... }:

{
  programs.yt-dlp = {
    enable = true;
    settings = {
      ignore-errors = true;
      output = "~/youtube/%(playlist)s/%(playlist_index)s\\ -\\ %(title)s.%(ext)s";
      write-sub = true;
      write-auto-sub = true;
      sub-langs = "en.\\*";
      format = "bestvideo[ext=webm][width<2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<2000][height<=1200]+bestaudio/best[width<2000][height<=1200]/best";
    };
  };
}
