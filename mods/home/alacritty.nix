{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary.background = "#fcfcfc";
      colors.primary.foreground = "#5c6166";
      env.TERM = "alacritty";
      font = {
        size = 11;
        normal.family = "JetBrainsMonoNLNerdFontMono";
      };
      keyboard.bindings = [
        {
          key = "F11";
          action = "ToggleFullscreen";
        }
      ];
      mouse.hide_when_typing = true;
    };
  };
}
