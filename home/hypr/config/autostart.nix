{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    #################
    ### AUTOSTART ###
    #################
    exec-once = [
      "waypaper --restore"
      "nm-applet"
      "systemctl --user start hyprpolkitagent"

      "mshell"
      "hypridle"

      "gtk-launch ktalk-hidden.desktop"
      "[workspace special silent] telegram-desktop"

      # clipboard manager
      "wl-paste --watch cliphist store"

      # set hdmi as primary display
      # "xrandr --output HDMI-A-1 --primary"
    ];
  };
}
