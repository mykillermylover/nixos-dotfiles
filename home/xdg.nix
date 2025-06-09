{ lib, pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "x-terminal-emulator" = [ "kitty.desktop" ];
      "application/x-terminal-emulator" = [ "kitty.desktop" ];

      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };

  xdg.configFile = {
    "xfce4/helpers.rc".text = ''
      TerminalEmulator=kitty
      TerminalEmulatorDismissed=true
    '';

    kvantum = {
      target = "Kvantum/kvantum.kvconfig";
      text = lib.generators.toINI { } {
        General.theme = "GraphiteDark";
      };
    };

    "Kvantum/Graphite".source = "${pkgs.graphite-kde-theme}/share/Kvantum/Graphite";

    qt5ct = {
      target = "qt5ct/qt5ct.conf";
      text = lib.generators.toINI { } {
        Appearance = {
          icon_theme = "Colloid-Dark";
          style = "kvantum";
        };
      };
    };

    qt6ct = {
      target = "qt6ct/qt6ct.conf";
      text = lib.generators.toINI { } {
        Appearance = {
          icon_theme = "Colloid-Dark";
          style = "kvantum";
        };
      };
    };
  };
}
