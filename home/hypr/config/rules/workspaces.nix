{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    ##################
    ### WORKSPACES ###
    ##################
    # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
    workspace = [
      "1, monitor:$builtInMon"
      "3, monitor:$builtInMon"
      "5, monitor:$builtInMon"
      "7, monitor:$builtInMon"
      "9, monitor:$builtInMon"
      "2, monitor:$externalMon"
      "4, monitor:$externalMon"
      "6, monitor:$externalMon"
      "8, monitor:$externalMon"
      "10,monitor:$externalMon"
    ];
  };
}
