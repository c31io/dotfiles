{
  programs.plasma = {
    enable = true;

    shortcuts = {
      kwin = {
        "Increase Opacity" = "Alt+Up";
        "Decrease Opacity" = "Alt+Down";

        "Invert" = "Meta+Ctrl+I";
        "InvertWindow" = "Meta+Ctrl+U";

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

      kdeglobals.General = {
        BrowserApplication = "firefox.desktop";
        TerminalApplication = "alacritty";
        TerminalService = "Alacritty.desktop";
      };

      kwinrc = {
        Desktops.Number = 3;
        Desktops.Rows = 3;
        Plugins.fadedesktopEnabled = true;
        Plugins.slideEnabled = false;
        Wayland.InputMethod = {
          value = "/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop";
          shellExpand = true;
        };
      };
    };

    panels = [
      {
        location = "bottom";
        widgets = [
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake";
            };
          }
          "org.kde.plasma.pager"
          {
            iconTasks = {
              launchers = [];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              date = {
                enable = true;
                format = "isoDate";
              };
              time.format = "12h";
              calendar = {
                firstDayOfWeek = "monday";
                showWeekNumbers = true;
              };
            };
          }
        ];
      }
    ];

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
