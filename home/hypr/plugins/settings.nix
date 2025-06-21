{ globals, ... }:
{
  wayland.windowManager.hyprland.settings.plugin = {
    xwaylandprimary = {
      display = globals.const.externalMon;
    };
  };
}
