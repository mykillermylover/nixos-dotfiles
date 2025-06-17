{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    #################
    ### AUTOSTART ###
    #################
    exec-once = [
      "hyprpaper"
      "nm-applet"
      "systemctl --user start hyprpolkitagent"

      "mshell"
      "hypridle"

      "ktalk -hidden"
      "[workspace 3 silent] squadus"
      "[workspace special silent] Telegram"

      # clipboard manager
      "wl-paste --watch cliphist store"

      # set hdmi as primary display
      # "xrandr --output HDMI-A-1 --primary"

      "gnome-keyring-daemon --start --components=secrets"
    ];
  };
}
