{ lib, pkgs, ... }:
{
  xdg = {
    enable = true;
    
    configFile = {
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
  };
}
