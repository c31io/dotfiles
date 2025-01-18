{
  programs.plasma = {
    enable = true;

    shortcuts = {
      kwin."Increase Opacity" = "Alt+Up,,Increase Opacity of Active Window by 5%";
      kwin."Decrease Opacity" = "Alt+Down,,Decrease Opacity of Active Window by 5%";

      kwin."Overview" = "Meta+Tab,Meta+W,Toggle Overview";

      kwin."Switch to Next Desktop" = "Meta+],,Switch to Next Desktop";
      kwin."Switch to Previous Desktop" = "Meta+[,,Switch to Previous Desktop";

      kwin."Window Fullscreen" = "Meta+Shift+Up,,Make Window Fullscreen";
      kwin."Window No Border" = "Meta+H,,Toggle Window Titlebar and Frame";

      "services/Alacritty.desktop"."New" = "Meta+Return";

      "services/firefox.desktop"."new-window" = "Meta+F";
      "services/firefox.desktop"."new-private-window" = "Meta+Shift+F";

      "services/google-chrome.desktop"."new-window" = "Meta+C";
      "services/google-chrome.desktop"."new-private-window" = "Meta+Shift+C";
    };

    configFile = {
      baloofilerc.General."exclude folders[$e]" = "$HOME/repo/";

      kdeglobals.General.BrowserApplication = "firefox.desktop";
      kdeglobals.General.TerminalApplication = "alacritty";
      kdeglobals.General.TerminalService = "Alacritty.desktop";

      kwinrc.Desktops.Number = 3;
      kwinrc.Desktops.Rows = 3;
      kwinrc.Plugins.fadedesktopEnabled = true;
      kwinrc.Plugins.slideEnabled = false;
    };

    window-rules = [
      {
        description = "No Decoration for Okular";
        match.window-class.value = "okular org.kde.okular";
        apply."No titlebar and frame" = true;
      }
      {
        description = "No Decoration for Alacritty";
        match.window-class.value = "alacritty Alacritty";
        apply."No titlebar and frame" = true;
      }
    ];
  };
}
