{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    #############################
    ### ENVIRONMENT VARIABLES ###
    #############################
    # See https://wiki.hyprland.org/Configuring/Environment-variables/
    env = [
      "TERM,kitty"

      # CURSORS
      "XCURSOR_THEME,BreezeX-RosePine-Linux"
      "XCURSOR_SIZE,24"

      "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      "HYPRCURSOR_SIZE,24"

      # QT ENVS
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "QT_QPA_PLATFORM,wayland"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_STYLE_OVERRIDE,kvantum "

      # Xorg ENVS
      "XDG_SESSION_TYPE,wayland "
      "XDG_SCREENSHOTS_DIR,~/Pictures/Screenshots"
    ];
  };
}
