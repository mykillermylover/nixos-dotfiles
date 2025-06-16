{
  inputs,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "WaveFox.Tabs.Shape" = 1;
        "WaveFox.Linux.Transparency.Enabled" = true;
        "browser.tabs.inTitlebar" = 1;
        "WaveFox.Toolbar.Transparency" = 4;
        "svg.context-properties.content.enabled" = true;
        "WaveFox.Icons" = 2;
        "userChrome.icon.panel_full" = true;
        "userChrome.icon.library" = true;
        "userChrome.icon.panel" = true;
        "userChrome.icon.menu" = true;
        "userChrome.icon.context_menu" = true;
        "userChrome.icon.global_menu" = true;
        "userChrome.icon.global_menubar" = true;
        "userChrome.icon.1-25px_stroke" = true;
        "userChrome.icon.account_image_to_right" = true;
        "userChrome.icon.account_label_to_right" = true;
        "userChrome.icon.menu.full" = true;
        "userChrome.icon.global_menu.mac" = true;
      };
    };
  };

  # Apply WaveFox with additional css
  home.file.".mozilla/firefox/default/chrome" =
    let
      extraCss = ''
        .tabbrowser-tab:hover {
          .tab-background:not([selected], [multiselected]) {
              background-image: none !important;
              background-color: rgba(15, 15, 15, 0.33) !important;
          }
        }
        .tab-background:is([selected], [multiselected]) {
            background-image: none !important;
            background-color: rgba(0, 0, 0, 0.5) !important;
        }

        #urlbar[open] #urlbar-background {
            background-image: none !important;
            background-color: rgba(25, 25, 25, 0.95) !important;
        }

        #star-button[starred] {
            fill: white !important;
        }
      '';

      patchedChrome = pkgs.runCommand "wavefox-chrome" { } ''
        mkdir -p "$out"
        cp -r --no-preserve=mode ${inputs.WaveFox}/chrome/* "$out"

        # Add extra css to userChrome.css:        
        cat >> "$out/userChrome.css" <<EOF
        ${extraCss}
        EOF
      '';
    in
    {
      source = patchedChrome;
    };
}
