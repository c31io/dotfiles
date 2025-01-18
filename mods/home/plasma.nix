{
  programs.plasma = {
    enable = true;

    shortcuts = {
      kwin = {
        "Increase Opacity" = "Alt+Up";
        "Decrease Opacity" = "Alt+Down";

        "Overview" = "Meta+Tab";

        "Switch to Next Desktop" = "Meta+]";
        "Switch to Previous Desktop" = "Meta+[";

        "Window Fullscreen" = "Meta+Shift+Up";
        "Window No Border" = "Meta+H";
      };

      "services/Alacritty.desktop"."New" = "Meta+Return";

      "services/firefox.desktop"."new-window" = "Meta+F";
      "services/firefox.desktop"."new-private-window" = "Meta+Shift+F";

      "services/google-chrome.desktop"."new-window" = "Meta+C";
      "services/google-chrome.desktop"."new-private-window" = "Meta+Shift+C";
    };

    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;

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
        apply.noborder.value = true;
      }
      {
        description = "No Decoration for Alacritty";
        match.window-class.value = "alacritty Alacritty";
        apply.noborder.value = true;
      }
    ];
  };
}
