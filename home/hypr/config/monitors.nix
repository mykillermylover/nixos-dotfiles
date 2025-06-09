{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    ################
    ### MONITORS ###
    ################

    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor = [
      "$builtInMon,  1920x1080@60, auto, 2.5" # 1.5
      "$externalMon, 1920x1080@75, auto-right, 1"
    ];
  };
}
