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

      "org.chromium.Chromium" = {
        "5E20835ACD6F47E67B482EF922CA447D-autofill_card" =
          ",none,Autofill the last used card for the current website";
        "5E20835ACD6F47E67B482EF922CA447D-autofill_identity" =
          ",none,Autofill the last used identity for the current website";
        "5E20835ACD6F47E67B482EF922CA447D-autofill_login" =
          ",none,Autofill the last used login for the current website";
        "5E20835ACD6F47E67B482EF922CA447D-generate_password" =
          ",none,Generate and copy a new random password to the clipboard";
        "5E20835ACD6F47E67B482EF922CA447D-lock_vault" = ",none,Lock the vault";
        "703F48DDE4A8C8604AD619129E785252-launch-element-picker" = ",none,Enter element picker mode";
        "703F48DDE4A8C8604AD619129E785252-launch-element-zapper" = ",none,Enter element zapper mode";
        "703F48DDE4A8C8604AD619129E785252-launch-logger" = ",none,Open the logger";
        "703F48DDE4A8C8604AD619129E785252-open-dashboard" = ",none,Open the dashboard";
        "703F48DDE4A8C8604AD619129E785252-relax-blocking-mode" = ",none,Relax blocking mode";
        "703F48DDE4A8C8604AD619129E785252-toggle-cosmetic-filtering" = ",none,Toggle cosmetic filtering";
        "703F48DDE4A8C8604AD619129E785252-toggle-javascript" = ",none,Toggle JavaScript";
        "8EEF175B998DB6C5655DAC29181577E2-addSite" = ",none,Toggle current site";
        "8EEF175B998DB6C5655DAC29181577E2-switchEngine" = ",none,Theme generation mode";
        "8EEF175B998DB6C5655DAC29181577E2-toggle" = ",none,Toggle extension";
      };

      "services/Alacritty.desktop"."New" = "Meta+Return";

      "services/chromium-browser.desktop"."new-window" = "Meta+U";
      "services/chromium-browser.desktop"."new-private-window" = "Meta+Shift+U";
    };

    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;

      kdeglobals.General = {
        accentColorFromWallpaper = true;
        BrowserApplication = "chromium-browser.desktop";
        TerminalApplication = "alacritty";
        TerminalService = "Alacritty.desktop";
      };

      kcminputrc.Keyboard.NumLock = 0;

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
        floating = true;
        hiding = "dodgewindows";
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
              launchers = [ ];
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

    kscreenlocker = {
      autoLock = false;
      appearance.wallpaperPictureOfTheDay.provider = "bing";
    };

    workspace = {
      wallpaperPictureOfTheDay.provider = "bing";
      wallpaperFillMode = "preserveAspectCrop";
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
