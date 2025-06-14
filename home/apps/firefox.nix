{ inputs, ... }:
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

  home.file.".mozilla/firefox/default/chrome".source = "${inputs.WaveFox}/chrome";
}
