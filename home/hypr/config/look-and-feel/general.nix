{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Variables/#general
    general = {
      gaps_in = 4;
      gaps_out = 8;

      border_size = 2;

      # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
      "col.active_border" = "rgba(1cd6b5ed) rgba(ffad33ee) rgba(fa4a36ed) 45deg";
      "col.inactive_border" = "rgba(59595980)";

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = false;

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = true;

      layout = "dwindle";
      gaps_workspaces = 100;
    };
  };
}
