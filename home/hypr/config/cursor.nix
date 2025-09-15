{ globals, ... }:
{
  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = 1;
      default_monitor = globals.const.externalMon.name;
    };
  };
}
